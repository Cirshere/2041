#!/bin/bash
 
if [ $# -ne 2 ]
then
    echo "Usage: ./scraping_courses.sh <year> <course-prefix>"
    exit 1
fi

if ! echo "$1" | grep -E '^[0-9]+$' > /dev/null || [ $1 -lt 2019 ] || [ $1 -gt 2021 ]
then
    echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2021"
    exit 1
fi

URL1="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

URL2="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

curl -sL ${URL1} + curl -sL ${URL2} | 2041 jq '.contentlets[] | .code + " " + .title' -r | sort -u
