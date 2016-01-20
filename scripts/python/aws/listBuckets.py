#!/usr/bin/python

import boto3

client = boto3.client('s3', 'us-west-2')

# Let's use Amazon S3
s3 = boto3.resource('s3')

print("s3.buckets: "+str(s3.buckets))

# Print out bucket names
for bucket in s3.buckets.all():
    print(bucket.name)
