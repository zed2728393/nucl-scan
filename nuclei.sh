#!/bin/bash

echo "Starting Nuclei Scan on $1 "

rm -f nuclei_results.txt   

nuclei -u "https://www.$1" -rl 2 -bs 1 -c 2 -etags wp,wpscan,wp-plugin,iot,phishing, -s low,medium,high,critical -o nuclei_results.txt

echo "Nuclei Results file:"

cat nuclei_results.txt
