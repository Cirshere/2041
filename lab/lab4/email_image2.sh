#!/bin/dash

for arg in "$@"
do
    #echo "$arg printed to screen if possible"
    # gm display "$arg"
    
    #echo -n "Address to e-mail this image to? "
    #read email
    #if [ -z "$email" ]
    #then
        #echo "No email sent"
        #continue
    #fi
    
    echo -n "Messsdage to accompany image? "
    read msg
    
    mutt -s $msg -a $arg -- $email

done