#!/bin/bash
#must be ran from project root directory


#check that the database exists
echo "You will need to enter MySQL password here."
result=$(mysql -u root -p -e "SHOW DATABASES LIKE 'BlogApplication';") 
if [[ $result == *"BlogApplication"* ]]; then 
	echo "The database exists." 
else 
	echo "The database does not exist." 
fi

#create virtual environment
if [ -d "env/" ]; then 
	echo "Directory exists." 
else 
	python3 -m venv env
fi

#start virtual environment
source env/bin/activate
#install requirements
pip3 install -r requirements.txt
#start the app
uvicorn main:app --reload
