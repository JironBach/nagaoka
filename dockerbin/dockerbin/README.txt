# requirements.txtの更新
pip3 freeze > requirements.txt後に
requirements.txtのgnupgとgpgをコメントアウト
requirements.txtにmysqlclientを追加。

https://nagaoka-django.herokuapp.com/


# dockerのセットアップ
docker build -t junshimo2/nagaoka_django .

docker tag junshimo2/nagaoka_django:latest junshimo2/nagaoka_django:tagname

docker push junshimo2/nagaoka_django:tagname

# local run
#docker run -it -p 28080:80 -p 18000:8000 -p 23306:3306 -v /Users/js/bin/python/test/nagaoka_proj:/root/nagaoka_proj  --add-host=local_django:192.168.0.55 --cap-add=NET_ADMIN junshimo2/nagaoka_django

# docer run
docker run -it -p 20080:80 -p 28000:8000 -p 23306:3306 -v /Users/js/.ssh:/root/.ssh -v /Users/js/bin/python/test/nagaoka_proj:/root/bin/python/test/nagaoka_proj --add-host=local_django:192.168.0.55 --cap-add=NET_ADMIN junshimo2/nagaoka_django

