#! /bin/bash
# resizes existing PDFs to ebook format by reading each line in a text file
#set -x #echo on

input=$PWD"/pdftoconvert.txt"
while IFS= read -r line
do
  echo "$PWD/$line".pdf
  #echo "gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$PWD/$line"_new"".pdf "$PWD/$line".pdf"
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$PWD/$line"_new"".pdf "$PWD/$line".pdf
  mv "$PWD/$line"_new".pdf" "$PWD/$line".pdf""
done < "$input"
