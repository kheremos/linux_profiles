#!/usr/bin/python

import boto3
import json

queueOfInterest="Infrastructure-Maestro-Queue"

sqs = boto3.resource('sqs')

queue = sqs.get_queue_by_name(QueueName=queueOfInterest);

print "Url:\n%s\n" % (queue.url)
"""Switch around single and double quotes to please the json parser."""
parsed = json.loads(str(queue.attributes).replace("\"","?@?").replace("\'","\"").replace("?@?","\'"))
print "Attributes:\n%s\n" % json.dumps(parsed,indent=3,sort_keys=True)

""" Process messages by printing out body and optional author name """
for message in queue.receive_messages(MessageAttributeNames=['Author']):
    """ Get the custom author message attribute if it was set """
    author_text = ''
    if message.message_attributes is not None:
        author_name = message.message_attributes.get('Author').get('StringValue')
        if author_name:
            author_text = ' ({0})'.format(author_name)
    """ Print out the body and author (if set) """
    print('Message: {0} \nAuthor: {1}'.format(message.body, author_text))
