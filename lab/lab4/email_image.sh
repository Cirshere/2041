#!/bin/dash

for arg in "$@"
do

    if [ ! -f $arg ]
    then
        echo "File does not exist"
        continue
    fi

    echo "$arg printed to screen if possible"
    
    
    gm display "$arg"
    
    echo -n "Address to e-mail this image to? "
    read email
    if [ -z "$email" ] # || ![ echo "$email" | grep -E '@(gmail|outlook|yahoomail).com$' ]
    then
        echo "No email sent"
        continue
    fi
    
    echo -n "Messsage to accompany image? "
    read msg
    
    echo $msg | mutt -a $arg -- $email
done
