"""
SIMPLE LAMBDA DEFINITION
"""

import sys

# IMPORT FROM LOCAL DIRECTORY
sys.path.append(".pip")

import polars as pl


def lambda_handler(event, _ctx):
    print("Hello this is just a simple lambda that prints the input payload")
    print(event)

    df = pl.DataFrame(
        {
            "name": ["Marco", "Mario", "Francesca", "Luigi"],
            "payrate": [100, 200, 300, 400],
            "senior": [False, False, True, True],
        }
    )

    senior_df = df.filter(pl.col("senior")).select(["name", "payrate"])

    print(senior_df.head(10))

    return {"statusCode": 200, "body": "Ok."}
