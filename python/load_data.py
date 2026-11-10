import pandas as pd
from sqlalchemy import create_engine

conn_string = 'postgresql+psycopg2://postgres:varsha%40123@localhost:5432/telco_churn_db'
db = create_engine(conn_string)
conn = db.connect()


# files = ['customers', 'geolocation', 'order_items', 'order_payments', 'order_reviews', 'orders', 'products', 'sellers', 
#       'product_category_name_translation']


#for file in files:
#   df = pd.read_csv(f"dataset/{file}.csv")
#    df.to_sql(file, con=conn, if_exists = 'replace', index = False)


df = pd.read_csv("../dataset/telco-customer-churn.csv")
df.to_sql('telco_customer_churn', con=conn, if_exists='replace', index=False)
    