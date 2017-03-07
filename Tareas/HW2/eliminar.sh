#!/bin/bash
sed "s/"Page"//g" doc.txt > doc1.txt
sed 's/[0-9]//g' doc1.txt > doc2.txt
perl -p -e 's/\n/ /' doc2.txt > doc3.txt
sed "s/ //g" doc3.txt > doc7.txt
