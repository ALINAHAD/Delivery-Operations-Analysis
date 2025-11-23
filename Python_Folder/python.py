# python_analysis.py
import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt
import seaborn as sns

from sqlalchemy import create_engine

# ---- CONFIG: update with your MySQL credentials ----
MYSQL_USER = 'root'
MYSQL_PASSWORD = 'AliMysql@0769'
MYSQL_HOST = 'localhost'
MYSQL_PORT = 3306
MYSQL_DB = 'delivery_db'

# ---- Function to fetch query ----
def fetch_query(query):
    conn = mysql.connector.connect(
        host=MYSQL_HOST,
        user=MYSQL_USER,
        password=MYSQL_PASSWORD,
        database=MYSQL_DB,
        port=MYSQL_PORT,
        allow_local_infile=True
    )
    df = pd.read_sql(query, conn)
    conn.close()
    return df

# ---- SQL ----
query = """
SELECT d.shipment_id, d.order_id, d.order_date, d.origin_city, d.destination_city, d.partner_id,
  d.pickup_time, d.out_for_delivery_time, d.delivered_time, d.delivery_status, d.distance_km,
  (c.fuel_cost + c.partner_payout + c.return_cost + c.other_costs) AS total_cost
FROM deliveries d
LEFT JOIN costs c ON d.shipment_id = c.shipment_id;
"""

df = fetch_query(query)
print('Rows fetched:', len(df))
print(df.head())

# ---- Cleaning ----
df['order_date'] = pd.to_datetime(df['order_date'])
df['pickup_time'] = pd.to_datetime(df['pickup_time'])
df['out_for_delivery_time'] = pd.to_datetime(df['out_for_delivery_time'])
df['delivered_time'] = pd.to_datetime(df['delivered_time'])

# ---- Derived Metrics ----
df['first_mile_delay_mins'] = (df['pickup_time'] - df['order_date']).dt.total_seconds() / 60
df['last_mile_duration_mins'] = (df['delivered_time'] - df['out_for_delivery_time']).dt.total_seconds() / 60
df['total_delivery_time_hrs'] = (df['delivered_time'] - df['order_date']).dt.total_seconds() / 3600
df['delivered_flag'] = df['delivery_status'] == 'Delivered'

# ---- KPIs ----
avg_pickup_delay = df['first_mile_delay_mins'].mean()
avg_last_mile = df['last_mile_duration_mins'].mean()
failed_pct = (df['delivery_status'] == 'Failed').mean() * 100
avg_cost = df['total_cost'].mean()

print(f"Avg pickup delay (mins): {avg_pickup_delay:.2f}")
print(f"Avg last mile duration (mins): {avg_last_mile:.2f}")
print(f"Failed %: {failed_pct:.2f}%")
print(f"Avg total cost per shipment: {avg_cost:.2f}")

# ---- VISUALS ----

# 1️⃣ Delivery Status
plt.figure(figsize=(8,5))
sns.countplot(data=df, x="delivery_status")
plt.title("Delivery Status Distribution")
plt.show()

# 2️⃣ Pickup Delay Distribution
plt.figure(figsize=(8,5))
sns.histplot(df["first_mile_delay_mins"], kde=True)
plt.title("Pickup Delay (mins)")
plt.show()

# 3️⃣ Last Mile Duration
plt.figure(figsize=(8,5))
sns.histplot(df["last_mile_duration_mins"], kde=True)
plt.title("Last Mile Duration (mins)")
plt.show()

# 4️⃣ Total Delivery Time (hrs)
plt.figure(figsize=(8,5))
sns.boxplot(data=df, y="total_delivery_time_hrs")
plt.title("Total Delivery Time (hrs)")
plt.show()

# 5️⃣ Cost vs Distance
plt.figure(figsize=(8,5))
sns.scatterplot(data=df, x="distance_km", y="total_cost")
plt.title("Distance vs Total Cost")
plt.show()

# 6️⃣ Partner-wise Avg Delivery Time
partner_summary = df.groupby("partner_id")["total_delivery_time_hrs"].mean().reset_index()
plt.figure(figsize=(10,5))
sns.barplot(data=partner_summary, x="partner_id", y="total_delivery_time_hrs")
plt.title("Average Delivery Time by Partner")
plt.show()

# ---- Export ----
df.to_csv('cleaned_delivery_data_from_mysql.csv', index=False)
print('Exported cleaned_delivery_data_from_mysql.csv')
 