#! /bin/sh

deep_clean(){
	make stop
	docker rmi -f $(docker images -a -q)
	docker system prune
}

echo "Carefull, it will remove everything in the cache, includind potentially other projects..."

while true; do
            read -p "🚀  Continue ? [y/n] " yn
    case $yn in
        [Yy]*) deep_clean ; exit 0  ;;
        [Nn]*) echo "Nothing changed" ; exit 1 ;;
    esac
done
