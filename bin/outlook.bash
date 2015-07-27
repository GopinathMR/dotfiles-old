#!/bin/bash
export file=$1
export fileName=`basename $file`
osascript -e 'tell application "Microsoft Outlook"' -e 'set newMessage to make new outgoing message with properties {subject:"Attachment"}' -e 'tell newMessage' -e 'make new attachment with properties {file:"/Users/gopi/dotfiles/bin/outlook.bash"}' -e 'end tell' -e 'open newMessage' -e 'end tell'
#-e 'make new recipient at newMessage with properties {email address:{name:"John Smith", address:"jsmith@example.com"}}'
