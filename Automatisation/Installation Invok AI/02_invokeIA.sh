mkdir ~/invokeai
cd ~/invokeai
python3 -m venv .venv --prompt InvokeAI
source .venv/bin/activate
python3 -m pip install --upgrade pip
pip3 install torch torchvision torchaudio
pip3 install "InvokeAI[xformers]" --use-pep517
deactivate && source .venv/bin/activate
invokeai-web

(sudo crontab -l 2>/dev/null; echo "@reboot bash /home/paperspace/03_run.sh") | crontab -