# A simple script that takes a photo with libcamera and uploads to S3.
# Verified working with HQ camera.

#!/bin/bash

export AWS_ACCESS_KEY_ID='replace-me'
export AWS_SECRET_ACCESS_KEY='replace-me'
export AWS_DEFAULT_REGION='ca-central-1'

BUCKET='replace-me'
DATE_TAKEN=$(date --utc +%Y%m%d_%H%M%SZ)

# Take photo
libcamera-jpeg -o $DATE_TAKEN.jpg -n -t 1

# Upload to S3
/home/pi/.local/bin/aws s3 cp $DATE_TAKEN.jpg s3://$BUCKET/$DATE_TAKEN.jpg

if [ $? -eq 0 ]; then
  mv $DATE_TAKEN.jpg photos-success/.
  echo "Success!"
else
  mv $DATE_TAKEN.jpg photos-failed/.
  echo "Failed!"
fi
