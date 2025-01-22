#!/bin/bash
echo "please wrote me link:"
read link

short=${link:0:5}

if [ "$short" == "https" ];
        then 
                echo "$link"
        else
                echo "error: link not https"
fi

