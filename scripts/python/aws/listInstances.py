#!/usr/bin/python

import boto3

ec2 = boto3.resource('ec2')

"""Given a tagable ec2_object, return dictionary of existing tags."""
def make_tag_dict(ec2_object):
    tag_dict = {}
    if ec2_object.tags is None: return tag_dict
    for tag in ec2_object.tags:
        tag_dict[tag['Key']] = tag['Value']
    return tag_dict

instances = ec2.instances.filter(
    Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])

# http://boto3.readthedocs.org/en/latest/reference/services/ec2.html#instance
for instance in instances:
    tags = make_tag_dict(instance) 
    print("\nInstance Name:\t\t%s " % tags.get('Name'))
    print("Instance BuildInfo:\t%s " % tags.get('BuildInfo'))
    print "ID:\t%s\tType:\t%s" % (instance.id, instance.instance_type )


