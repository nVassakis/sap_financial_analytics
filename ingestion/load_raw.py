import re
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, text

engine = create_engine("postgresql+psycopg2://nikos@localhost:5432/sap_financials")

with engine.begin() as conn:
    conn.execute(text("CREATE SCHEMA IF NOT EXISTS raw"))

raw_dir = Path("data/raw")

for csv_path in sorted(raw_dir.glob("*.csv")):
    # Turn filename into a table name e.g. "GL Accounts.csv" -> "gl_accounts"
    name = csv_path.stem.lower()
    name = re.sub(r"[^a-z0-9]+", "_", name)
    table_name = name.strip("_")

    # Read the CSV 
    df = pd.read_csv(csv_path, sep=None, engine="python")

    # Replace with real nulls
    df = df.replace("#", None)

    # Write to PostgreSQL
    df.to_sql(table_name, engine, schema="raw", if_exists="replace", index=False)

    print(f"{csv_path.name} -> raw.{table_name} ({len(df):,} rows)")