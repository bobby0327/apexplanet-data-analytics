import sqlite3
import pandas as pd

conn = sqlite3.connect("churn.db")

query = """
SELECT Churn,
       ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM churn_data
GROUP BY Churn;
"""

df = pd.read_sql(query, conn)

print(df)

conn.close()