#!/bin/bash

echo "Starting Nuclei Scan on $1 "

target=$(echo "$1" | sed -E 's~^https?://~~')

rm -f nuclei_results.txt   

# -rl max number of requests per second
# -bs bulk size keep low due to github
# -c concurrency, maximum number of templates to be excuted together
# maybe use -uncover and -ur and -ue 
# -H "User-Agent: Intigriti - rm777 - Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
nuclei -u "https://$target" -rl 5 -bs 1 -c 2  -etags iot,phishing \ 
-H "Intigriti-Bug-Bounty: ID-10226f54c28c4a43b722424920c709dff1a49067004e8989d3dde9f4b7136ffa" \
-s low,medium,high,critical -o nuclei_results.txt

echo "Nuclei Results file:"

cat nuclei_results.txt
