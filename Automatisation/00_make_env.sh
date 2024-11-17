if [ -f ".env" ]; then
    echo "Le fichier '.env' existe"
    echo "voulez vous l'écraser ?"
    read -p "yes/no : " yesNo
    if [ "$yesNo" = "yes" ]; then
        echo "La valeur est yes"
        echo "On supprimme .env"
        rm -f .env
    else
        echo "La valeur est no"
        echo "On quitte"
        exit 0
    fi
fi



read -p "Token PaperSpace : " tokenPaperSpace
read -p "OVH Application name : " OVHApplicationName
read -p "OVH Application secret : " OVHApplicationSecret
read -p "OVH Application key : " OVHApplicationKey
read -p "OVH Consumer Key : " OVHConsumerKey

echo "tokenPaperSpace=$tokenPaperSpace" > .env
echo "OVHApplicationName=$OVHApplicationName" >> .env
echo "OVHApplicationSecret=$OVHApplicationSecret" >> .env
echo "OVHApplicationKey=$OVHApplicationKey" >> .env
echo "OVHConsumerKey=$OVHConsumerKey" >> .env