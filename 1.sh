#!/bin/sh

burl="https://gateway.pinata.cloud/ipfs/Qmc6FdEKKF8TLciNK28wyVQJhQAV97Utd5RxsQ1GHHC19p/";

for file in *.json; do
    bfilename=`basename $file .json`;
    url=$burl$bfilename.png;
    echo $file;

    mv $file temp.json;
    cat temp.json | ./jq-win64.exe -r '.image |= "'$url'"' > $file
    rm temp.json
done


#cat test.json | ./jq-win64.exe -r '.image |= "test"' > temp.json