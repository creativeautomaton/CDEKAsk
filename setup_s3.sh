#!/bin/bash
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.

set -e

# Configure AWS
# AWS_ID=""
# AWS_KEY=""

pip install boto3
BUCKET_NAME = 'cdek-ml' # replace with your bucket name

# enter authentication credentials
s3 = boto3.resource('s3', aws_access_key_id = "$AWS_ID",
                          aws_secret_access_key= "$AWS_KEY")

# Download all large phrase indexes to the dataset dups folder
KEY1 = 'datasets/dumps/denspi_2020-04-10/phrase/0-10.hdf5'
KEY2 = 'datasets/dumps/denspi_2020-04-10/phrase/10-20.hdf5'
KEY3 = 'datasets/dumps/denspi_2020-04-10/phrase/20-30.hdf5'
KEY4 = 'datasets/dumps/denspi_2020-04-10/phrase/30-37.hdf5'

try:
  # we are trying to download training dataset from s3 with name 'datasets/dumps/denspi_2020-04-10/phrase/0-10.hdf5'
  # to colab dir with name `training.csv`
  s3.Bucket(BUCKET_NAME).download_file(KEY1, 'datasets/dumps/denspi_2020-04-10/phrase/0-10.hdf5')

except botocore.exceptions.ClientError as e:
  if e.response['Error']['Code'] == "404":
    print("The object does not exist.")
  else:
    raise

echo "AWS Bucket Setup download done!"
