#!/usr/bin/env bash
# CreateWebSite "nom du fichier" "titre" "chemin des images"
page="$1"
title="$2"
folder="$3"

controleVariable() {

    if [ $# = 3 ]; then
        return 1
    elif [ "$1" = "" ]; then
                echo -e "Enter new web page name ... \c";
                read -r "page";
            else
            page="$1";
        fi
        if [ "$2" = "" ]; then
            echo -e "Enter the title ... \c";
            read -r "title";
        else
            title="$2";
        fi
        if [ "$3" = "" ]; then
            echo -e "Enter the folder path ... \c";
            read -r "folder";
        else
            folder="$3";
        fi
    
}
echo "$@"
controleVariable "$@"
echo "$folder"

