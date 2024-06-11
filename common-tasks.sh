# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# run this lab's specific tasks saved on GitHub
curl --silent --output /tmp/$LAB_ID.sh https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/$LAB_ID.sh
bash -x /tmp/$LAB_ID.sh
