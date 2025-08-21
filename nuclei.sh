#!/bin/bash

echo "Starting Nuclei Scan on $1 "

nuclei -u "https://www.$1" -rl 2 -bs 1 -c 2 -etags wp,wpscan,wp-plugin,iot,phishing, -s low,medium,high,critical -silent -o nuclei_results.txt
