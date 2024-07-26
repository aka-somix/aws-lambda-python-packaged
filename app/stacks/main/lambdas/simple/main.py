"""
SIMPLE LAMBDA DEFINITION
"""
import sys

# IMPORT FROM LOCAL DIRECTORY
sys.path.append(".pip")


def lambda_handler(event, _ctx):
    print("Hello this is just a simple lambda that prints the input payload")
    print(event)

    return {"statusCode": 200, "body": "Ok."}
