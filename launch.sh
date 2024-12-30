#!/bin/bash

source env/bin/activate
pip3 install -r requirements.txt
uvicorn main:app --reload
