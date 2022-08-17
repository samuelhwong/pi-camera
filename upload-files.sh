# Script that uploads a set of files to S3.
# Usage: Create a file called photos.log that contains a list of local filenames, one per line.
#        Then execute ./upload-files.sh

#!/bin/bash

export AWS_ACCESS_KEY_ID='replace-me'
export AWS_SECRET_ACCESS_KEY='replace-me'
export AWS_DEFAULT_REGION='ca-central-1'

BUCKET='replace-me'

while read p; do
  echo "===> $p"
  aws s3 cp $p s3://$BUCKET/$p
done < photos.log
