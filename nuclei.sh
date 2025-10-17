#!/bin/bash

echo "Starting Nuclei Scan on $1 "

target=$(echo "$1" | sed -E 's~^https?://~~')

rm -f nuclei_results.txt   

# -rl max number of requests per second
# -bs bulk size keep low due to github
# -c concurrency, maximum number of templates to be excuted together
# maybe use -uncover and -ur and -ue 
nuclei -u "https://$target" -rl 5 -bs 1 -c 2 -etags iot,phishing, -H "X-Intigriti-Username: rm777 " -H "User-Agent: Intigriti - rm777 - Mozilla/5.0 (Windows NT 10.0; Win64; x64)" -s low,medium,high,critical -o nuclei_results.txt

echo "Nuclei Results file:"

cat nuclei_results.txt
