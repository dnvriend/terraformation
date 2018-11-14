#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BUCKETNAME=$(cat $HOME/bucket.txt)
FILENAME_ORG=original-file.txt
S3_RENAMED_FILE=s3://$BUCKETNAME/renamed-file.txt

VERSION_FILE_NAME=versioned.txt
LOCAL_VERSION_FILE=$HOME/$VERSION_FILE_NAME
S3_VERSION_FILE=s3://$BUCKETNAME/$VERSION_FILE_NAME

OBJECT_VERSIONS=$(aws --output text s3api list-object-versions --bucket $BUCKETNAME | grep -E '^VERSIONS|^DELETEMARKERS')

while read -r OBJECT_VERSION; do
echo $OBJECT_VERSION
    if [[ $OBJECT_VERSION == DELETEMARKERS* ]]; then
        KEY=$(echo $OBJECT_VERSION | awk '{print $3}')
        VERSION_ID=$(echo $OBJECT_VERSION | awk '{print $5}')
    else
        KEY=$(echo $OBJECT_VERSION | awk '{print $4}')
        VERSION_ID=$(echo $OBJECT_VERSION | awk '{print $8}')
    fi
    aws s3api delete-object --bucket $BUCKETNAME --key $KEY --version-id $VERSION_ID > /dev/null
done <<< "$OBJECT_VERSIONS";

# Remove the bucket with --force option to remove any remaining files without versions.
aws s3 rb --force s3://$BUCKETNAME