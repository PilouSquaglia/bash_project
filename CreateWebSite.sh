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

controlOption "$@"
controlParametre "$@"

echo "$folder"

