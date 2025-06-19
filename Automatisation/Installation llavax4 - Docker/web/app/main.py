from fastapi import FastAPI, UploadFile, File
from transformers import AutoProcessor, AutoModelForVision2Seq
from transformers import AutoProcessor, LlavaForConditionalGeneration
from PIL import Image
import torch

app = FastAPI()

# Charger modèle une seule fois
#MODEL_ID = "llava-hf/llava-1.5-7b-hf"
#MODEL_ID = "liuhaotian/llava-v1.5-7b"
MODEL_ID = "llava-hf/llava-1.5-7b-hf"
REVISION = "a272c74"
device = "cuda" if torch.cuda.is_available() else "cpu"

print("🔄 Chargement modèle...")
processor = AutoProcessor.from_pretrained(MODEL_ID, revision=REVISION)
model = LlavaForConditionalGeneration.from_pretrained(
    MODEL_ID, torch_dtype=torch.float16, revision=REVISION, low_cpu_mem_usage=True
).to(device)

@app.post("/analyze/")
async def analyze_image(file: UploadFile = File(...)):
    image = Image.open(file.file).convert("RGB")
    prompt = "<|user|> <image>\ncrée un JSON contenant \n - les légendes de l'image en FR sous la clef \"caption_fr\", en EN sous la clef \"caption_en\" \n  - les mots clefs en FR sous \"keywords_fr\" , en EN \"keywords_en\"<|end|>\n<|assistant|>"

    inputs = processor(images=image, text=prompt, return_tensors="pt").to(device, torch.float16)
    output = model.generate(**inputs, max_new_tokens=100)

    response = processor.batch_decode(output, skip_special_tokens=True)[0]
    match = re.search(r"\{.*\}", response, re.DOTALL)
    if match:
        json_str = match.group(0).replace("\\","")
        try:
            parsed = json.loads(json_str)
            return parsed
        except json.JSONDecodeError:
            return {"error": "JSON malformé", "output": json_str}
    else:
        return {"error": "Aucun JSON détecté", "output": response}
    return {"description": response.strip()}


import re
import json

