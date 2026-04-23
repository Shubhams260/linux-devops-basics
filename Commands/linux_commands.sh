#!/bin/bash

echo "Creating directory and file"
mkdir test_dir
cd test_dir
touch example.txt
mv example.txt renamed_example.txt

echo "Simulating /etc/passwd"
echo -e "root:x:0:0:root:/root:/bin/bash\nuser:x:1000:1000:user:/home/user:/bin/bash" > users.txt

echo "Viewing file contents"
cat users.txt
head -n 1 users.txt
tail -n 1 users.txt

echo "Searching patterns"
grep "root" users.txt

echo "Zipping and unzipping using tar"
cd ..
tar -cvf test_dir.tar test_dir
tar -xvf test_dir.tar

echo "Downloading file using curl"
curl -O https://example.com

echo "Changing permissions"
touch secure.txt
chmod 444 secure.txt
ls -l secure.txt

echo "Environment variable"
export MY_VAR="Hello, Linux!"
echo $MY_VAR