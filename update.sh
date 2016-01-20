#!/bin/bash
while IFS='' read -r link || [[ -n "$link" ]]; do
	HOSTNAME=($(echo $link | awk -F/ '{print $3}'))
	if [ ! -d "$HOSTNAME" ]; then
		mkdir $HOSTNAME
	fi
    wget $link -e use_proxy=yes -e http_proxy=127.0.0.1:4444 -O "$HOSTNAME"/hosts || 
    if [ $? -ne 0 ]; then
		git checkout "$HOSTNAME"/hosts
    fi
done < hostslink

M=$(git status --porcelain 2>/dev/null| grep "^ M" | wc -l)
if [ $M -gt 0 ]
then
	git add .
	git commit -m "Update hosts"
	git push
else
	echo "No update"
fi

