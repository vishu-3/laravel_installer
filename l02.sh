#! /bin/bash -x


echo "Laravel project Installation Via Shell script" &&

cd /var/www/html/  &&

echo "Enter App Name:" &&
read appname          &&

echo "Enter App Version:" &&
read appversion          &&

composer create-project --prefer-dist laravel/laravel $appname  "$appversion"  &&


echo "Laravel project Folder Permission For Apache" &&

cd $appname/ &&
sudo chown -Rv $USER:www-data . && sudo find . -type f -exec chmod 664 {} \; && sudo find . -type d -exec chmod 775 {} \; && sudo chgrp -Rv www-data storage/ bootstrap/cache/ && sudo chmod -Rv ug+rwx storage/ bootstrap/cache/  &&

cd /var/www/html/$appname/ &&
mv ./public/.htaccess  .  &&

mv ./server.php ./index.php








