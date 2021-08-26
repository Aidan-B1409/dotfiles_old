#!/bin/bash
# example run
# ./gitinit.sh -l "Python" -n "Ritual 1" -r  

BASEURL="https://raw.githubusercontent.com/github/gitignore/master/"
LANG=""
NAME=""
REMOTE=""

while getopts "l:n:r:" arg
do
    case $arg in
        "l")
            LANG=$OPTARG
            ;;
        "n")
            NAME=$OPTARG
            ;;
        "r")
            REMOTE=$OPTARG
            ;;        
    esac
done

# echo "# ${NAME} \n Behold Perry the Platypus, my repos-inator! With one tap of this button, I can make as many git repos as I want!" > README.md
mkdir ${NAME}
cd ${NAME}
echo "# ${NAME}" > README.md
echo "Project start ritual for speed, power, and profit \$\$\$" >> README.md
curl -L -o ".gitignore" "${BASEURL}${LANG}.gitignore"
git init
git add .
git commit -m "Initial Commit - Courtesy of the Repos-inator"
git branch -M main
git remote add origin ${REMOTE}
git push -u origin main

