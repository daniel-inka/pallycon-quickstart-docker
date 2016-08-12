echo "changing directory.."
cd /usr/src/app/packager
echo "start packaging.."
./PallyConPackager --site-id 8KAJ --packager-key JKXBwTFJisxDHkbp5wWY6vOrQaZkqhl7 --contents-id appsealing_intro --dash --i /usr/local/work/appsealing_intro.mp4 --o /usr/local/work
echo “packaging done!”
