from pyspark.sql import SparkSession
from pyspark.sql.functions import col,isnan, count

spark = SparkSession \
        .builder \
        .config("spark.jars",
                "/Users/sahilnagpal/Downloads/mysql-connector-java-8.0.29.jar") \
        .master("local[*]") \
        .appName("leetcode-problems") \
        .getOrCreate()


namaste_orders = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "namaste_orders") \
    .option("user", "root") \
    .option("password", "password") \
    .load()

namaste_returns = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "namaste_returns") \
    .option("user", "root") \
    .option("password", "password") \
    .load()

namaste_returns.show()
namaste_orders.show()

count_vals = namaste_orders.filter((col("city").isNull()) | (isnan(col("city")))).count()
print("null count : ",count_vals)

namaste_orders = namaste_orders\
    .withColumnRenamed("order_id","orders_order_id")


namaste_orders\
    .join(namaste_returns,on=namaste_orders.orders_order_id == namaste_returns.order_id,how="left")\
    .groupby(col("city"))\
    .agg(count("order_id").alias("cnt"))\
    .filter(col("cnt")==0)\
    .select("city")\
    .show()

