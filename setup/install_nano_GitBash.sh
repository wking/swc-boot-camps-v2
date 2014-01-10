#A simple script for installing nano for Git Bash. Based on the instructions from https://coderwall.com/p/ee-law

curl -L -O http://www.nano-editor.org/dist/v2.2/NT/nano-2.2.6.zip
unzip nano-2.2.6.zip -d nanoDIR


mv nanoDIR ~/bin
rm nano-2.2.6.zip

echo -e '#!/bin/sh \n exec ~/bin/nanoDIR/nano.exe' > ~/bin/nano