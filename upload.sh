

echo
echo Building site
echo

rm -rf build
yarn run eleventy --input=src --output=build

echo
echo Compressing files
echo
gzip -k -9 build/**

echo
echo Uploading files
echo
ssh quinoaa.moe "rm -rf /var/www/quinoaa.moe/public;mkdir /var/www/quinoaa.moe/public"

scp build/* quinoaa.moe:/var/www/quinoaa.moe/public/