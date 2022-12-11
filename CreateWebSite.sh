#!/usr/bin/env bash

page="$1"
title="$2"
folder="$3"

controlOption() {
    while getopts ":hn:" option; do
        case $option in
        h) # display Help
            Help
            exit
            ;;
        n) # Enter a name
            Name=$OPTARG ;;
        \?) # Invalid option
            echo "Error: Invalid option"
            Help
            exit
            ;;
        esac
    done
}

Help() {
    echo "Add description of the script functions here."
    echo
    echo "Syntax: CreateWebSite \"nom du fichier" "titre" "chemin des images"\"
    echo "options:"
    echo "g     Print the GPL license notification."
    echo "h     Print this Help."
    echo "v     Verbose mode."
    echo "V     Print software version and exit."
    echo
}

Name="world"

controlParametre() {

    if [ $# = 3 ]; then
        return 1
    elif [ "$1" = "" ]; then
        echo -e "Enter new web page name ... \c"
        read -r "page"
    else
        page="$1"
    fi
    if [ "$2" = "" ]; then
        echo -e "Enter the title ... \c"
        read -r "title"
    else
        title="$2"
    fi
    if [ "$3" = "" ]; then
        echo -e "Enter the folder path ... \c"
        read -r "folder"
    else
        folder="$3"
    fi

}

controlFichier() {
    echo "$1.txt"
    if ! [ -e "$2$1.txt" ]; then
        echo "Fichier n'existe pas"
        cat "$2.fichierconfig" >"$2$1.txt"

    fi

}

echo "$@"

controlOption "$@"
controlParametre "$@"

mkdir "$title"
cd "$title" || exit

cp ../src/Index.php ./
cp ../src/home.php ./
cp ../src/css.css ./

cp -R ../src/images ./
mv -f images Picture

for item in ./Picture/*; do
    if [[ "${item}" =~ \.(j?p(e|n)?g|webp) ]]; then

        nomFichier="${item##*/}"
        nomFichier=$(echo "$nomFichier" | cut -f 1 -d '.')

        controlFichier "$nomFichier" "./Picture/"
     
        titre=$(grep titre ./Picture/"${nomFichier}".txt | cut -d ":" -f 2 )
        description=$(grep description ./Picture/"${nomFichier}".txt | cut -d ":" -f 2 )
        lien=$(grep lien ./Picture/"${nomFichier}".txt | cut -d ":" -f 2 )
       
        cp ../src/picture.php ./Picture
        mv ./Picture/picture.php ./Picture/"${nomFichier}".php

        cheminPic="./Picture/${nomFichier}.jpeg"

        sed -i '' "s/titlePicture/${nomFichier}/" Picture/"${nomFichier}".php
        sed -i '' "s/titleCard/${titre}/" ./Picture/"${nomFichier}".php
        sed -i '' "s@folder@${cheminPic}@" ./Picture/"${nomFichier}".php
        sed -i '' "s/description/${description}/" ./Picture/"${nomFichier}".php
        sed -i '' "s/lien/${lien}/" ./Picture/"${nomFichier}".php

        cat ./Picture/"$nomFichier".php >>home.php
    fi

done

#sed "s/title/${titlePicture}/" ../src/home.php > home.php
