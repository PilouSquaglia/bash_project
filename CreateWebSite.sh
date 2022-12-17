#!/usr/bin/env bash

page="$1"
title="$2"
folder="$3"

controlParametre() {

    if [ $# = 3 ]; then
        return 1
    elif [ "$#" -gt "3" ]; then
        echo "trop de paramètres"
        help
        exit
    fi
    if [ "$1" = "" ]; then
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

    return 1

}

controlFichier() {
    if ! [ -e "$2$1.txt" ]; then
        echo "Fichier $1.txt n'existe pas on en avons créé un par défaut modifié le et relancez la commande avec -r"
        cat "$2.fichierconfig" >"$2$1.txt"

    fi

}

makePost() {

    for item in "$1"/Picture/*; do
        if [[ "${item}" =~ \.(j?p(e|n)?g|webp) ]]; then

            nomFichier="${item##*/}"
            nomFichier=$(echo "$nomFichier" | cut -f 1 -d '.')

            controlFichier "$nomFichier" "./Picture/"

            titre=$(grep titre ./Picture/"${nomFichier}".txt | cut -d ":" -f 2)
            description=$(grep description ./Picture/"${nomFichier}".txt | cut -d ":" -f 2)
            lien=$(grep lien ./Picture/"${nomFichier}".txt | cut -d ":" -f 2)

            cp ../src/picture.html ./Picture
            mv ./Picture/picture.html ./Picture/"${nomFichier}".html

            cheminPic="./Picture/${nomFichier}.jpeg"

            sed -i '' "s/titlePicture/${nomFichier}/" Picture/"${nomFichier}".html
            sed -i '' "s/titleCard/${titre}/" ./Picture/"${nomFichier}".html
            sed -i '' "s@folder@${cheminPic}@" ./Picture/"${nomFichier}".html
            sed -i '' "s/description/${description}/" ./Picture/"${nomFichier}".html
            sed -i '' "s/lien/${lien}/" ./Picture/"${nomFichier}".html

            cat ./Picture/"$nomFichier".html >>home.html
        fi

    done
}
searchTxt() {

    for item in "$1"/Picture/*; do

        if [[ "${item}" =~ \.txt ]]; then

            nomFichier="${item##*/}"
            nomFichier=$(echo "$nomFichier" | cut -f 1 -d '.')
         
            mv -f "${item}" ./src/images/"${nomFichier}.txt"
         
        fi
    done
    
    rm -r "$1"

}
makeAll() {

    mkdir "$title"
    cd "$title" || exit

    cp -R ../src/* ./
    sed -i '' "s/HOME/$page/" home.html
    sed -i '' "s/HOME/$page/" header.html
    mv -f images Picture

    makePost ./

    cd ..

    mv "$title" "$folder"
}

Help() {
    echo "Add description of the script functions here."
    echo
    echo "Syntax: CreateWebSite \"nom du fichier" "titre" "chemin des images"\"
    echo "options:"
    echo "h     Print this Help."
    echo "r     Reload the text picture to the src/images you need to reload the command"
    echo "Make command like this: ./CreateWebSite.sh page titre ./test   "
}

controlOption() {
    while getopts "hr:" option; do
        case $option in
        h) # display Help
            Help
            exit
            ;;
        r)
            searchTxt "$OPTARG"
            exit
            ;;
        \?) # Invalid option
            echo "Error: Invalid option"
            Help
            exit
            ;;

        esac

    done

    controlParametre "$@"
    makeAll "$@"
    exit
}

controlOption "$@"
