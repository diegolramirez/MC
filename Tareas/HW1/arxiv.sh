#!/bin/bash
#Save num of results in a variable
count=$(curl -s http://arxiv.org/list/astro-ph.GA/new | grep '<span class="descriptor">Title:</span> ' | grep -ci $1)
#Save each line of results in an array called results
IFS='
'
results=($(curl -s http://arxiv.org/list/astro-ph.GA/new | grep '<span class="descriptor">Title:</span> ' | grep -i $1 | sed 's/<span class="descriptor">Title:<\/span>\ //g'))
#Format the output
figlet arXiv
echo '======================================
Searching the arXiv for the new Stuff
http://arxiv.org/list/astro-ph.GA/new
======================================
keyword: '$1
echo '======================================
Articles found: '$count
#As the results are in an array I extract them in this for loop
for ((i=0; i<$count; i++))
do
	echo '- '${results[$i]}
done
echo '======================================'
