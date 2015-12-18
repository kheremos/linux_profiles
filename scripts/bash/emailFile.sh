#!/bin/bash

# This is still a work in progress, untested and not robust.

# usage
display_usage() { 
	echo "Send a file to an email using sendmail(required)." 
	echo -e "\nUsage:\n$0 DESTINATION ATTACHMENT (SUBJECT) (FROM)\n" 
	} 
#Mime type helper
get_mimetype(){
  # warning: assumes that the passed file exists
  file --mime-type "$1" | sed 's/.*: //' 
}
# Check that sendmail is installed
hash sendmail 2>/dev/null || { display_usage; exit 1; }

if [  $# -le 1 ] 
	then 
		display_usage
		exit 1
	fi 

# some variables
to=$1
subject=$3
: ${subject:="An attachment from $0"}
from=$4
: ${from:="noreply@google.com"}
boundary="ZZ_/afg6432dfgkl.94531q"
body="This is the body of our email"
declare -a attachments
# This can be extended to send multiple attachments
attachments=( "$2" )

echo "Sending $attachments to:$to from:$from subject:\'$subject\'" 

# Build headers
{

printf '%s\n' "From: $from
To: $to
Subject: $subject
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=\"$boundary\"

--${boundary}
Content-Type: text/plain; charset=\"US-ASCII\"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

$body
"
 
# now loop over the attachments, guess the type
# and produce the corresponding part, encoded base64
for file in "${attachments[@]}"; do

  [ ! -f "$file" ] && echo "Warning: attachment $file not found, skipping" >&2 && continue

  mimetype=$(get_mimetype "$file") 
 
  printf '%s\n' "--${boundary}
Content-Type: $mimetype
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"$file\"
"
 
  base64 "$file"
  echo
done
 
# print last boundary with closing --
printf '%s\n' "--${boundary}--"
 
} | sendmail -t -oi   # one may also use -f here to set the envelope-from


get_mimetype(){
  # warning: assumes that the passed file exists
  file --mime-type "$1" | sed 's/.*: //' 
}
