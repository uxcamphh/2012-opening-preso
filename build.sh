#!/bin/sh

# filestructure:
#
# project
#  |- .git
#  |- build.sh // this file
#  |- source/
#      |- index.html.haml
#      |- controller.rb
#      |- ...
#
# stasis will render everything into a "public" folder
# then the files from public will be copied to the project base folder, allowing for easy publishing via github pages (or any other server base html folder).
#
# i guess with r

cd source
echo ""
pwd
stasis -d 9999

echo ""
echo ""
echo "now copying..."
echo ""
cp -R -v public/* ./..

cd ..

echo ""
pwd

git s #assuming you have a got a git alias configured
echo ""
read -p "commit? (y/n) " publish
if [ "$publish" == "y" ]; then
  echo ""
  read -p "commit message: " commitmessage
  echo ""
  git add -A #assuming your .gitignore is configured
  git commit -m "$commitmessage"

  echo ""
  read -p "push? (y/n) " push
  if [ "$push" == "y" ]; then
    echo ""
    git push origin #assuming you have pushed your branch to orign
    echo ""
  else
  echo "NO2"
  fi

else
  echo "NO"
fi
