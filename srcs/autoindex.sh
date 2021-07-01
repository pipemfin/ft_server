if [ ${1} -eq 1 ]
then
cd /../etc/nginx/sites-available/
sed -i 's/autoindex off/autoindex on/g' localhost.conf
service nginx restart
echo "Автоиндексация включена"
elif [ ${1} -eq 2 ]
then
cd /../etc/nginx/sites-available/
sed -i 's/autoindex on/autoindex off/g' localhost.conf
service nginx restart
echo "Автоиндексация выключена"
else
echo "Задайте в качестве параметра 1 (включить) or 2 (выключить)"
fi
cd /..
