#!/usr/bin/python

import boto3

bucketName = "jenkins"
client = boto3.client('s3', 'us-west-2')

# Let's use Amazon S3
s3 = boto3.resource('s3')

print("s3.buckets: "+str(s3.buckets))

# Print out bucket names
for bucket in s3.buckets.all():
    print(bucket.name)
    # Investigate objects in specific bucket
    if bucket.name == bucketName:
      for key in bucket.objects.all():
        obj = s3.Object(bucket.name,key.key)
        print "\t%s\t%s"%(obj.key,obj.metadata)
