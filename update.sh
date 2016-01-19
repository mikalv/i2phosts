#wget http://i2p-projekt.i2p/hosts.txt -e use_proxy=yes -e http_proxy=127.0.0.1:4444 -O i2p-projekt.i2p/hosts || git checkout i2p-projekt.i2p/hosts
#wget http://i2pjump.i2p/hosts -e use_proxy=yes -e http_proxy=127.0.0.1:4444 -O i2pjump.i2p/hosts || git checkout i2pjump.i2p/hosts
#wget http://inr.i2p/export/alive-hosts.txt -e use_proxy=yes -e http_proxy=127.0.0.1:4444 -O inr.i2p/hosts || git checkout inr.i2p/hosts
#wget http://stats.i2p/cgi-bin/newhosts.txt -e use_proxy=yes -e http_proxy=127.0.0.1:4444 -O stats.i2p/hosts || git checkout stats.i2p/hosts
#wget http://no.i2p/export/alive-hosts.txt -e use_proxy=yes -e http_proxy=127.0.0.1:4444 -O no.i2p/hosts || git checkout no.i2p/hosts


M=$(git status --porcelain 2>/dev/null| grep "^ M" | wc -l)
if [ $M -gt 0 ]
then
	git add .
	git commit -m "Update hosts"
	git push
else
	echo "No update"
fi

