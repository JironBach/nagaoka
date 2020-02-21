# dockerのセットアップ
docker build -t junshimo2/nagaoka_rails .

docker tag junshimo2/nagaoka_rails:latest junshimo2/nagaoka_rails:tagname

docker push junshimo2/nagaoka_rails:tagname

# local run
#docker run -it -p 18080:80 -p 18000:8000 -p 23306:3306 -v /Users/js/work/nagaoka:/root/nagaoka  --add-host=local_django:192.168.0.55 --cap-add=NET_ADMIN junshimo2/nagaoka_rails

# docker run
docker run -it -p 10080:80 -p 13000:3000 -p 13306:3306 -v /Users/js/.ssh:/root/.ssh -v /Users/js/work/nagaoka:/root/nagaoka --add-host=local_rails:192.168.0.55 --cap-add=NET_ADMIN junshimo2/nagaoka_rails

