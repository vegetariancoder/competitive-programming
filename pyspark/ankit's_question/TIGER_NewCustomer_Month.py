from pyspark.sql import SparkSession
from pyspark.sql.functions import min,col,substring,count

spark = SparkSession \
        .builder \
        .config("spark.jars",
                "/Users/sahilnagpal/Downloads/mysql-connector-java-8.0.29.jar") \
        .master("local[*]") \
        .appName("leetcode-problems") \
        .getOrCreate()


sales = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "sales") \
    .option("user", "root") \
    .option("password", "password") \
    .load()

sales.show()


sales\
    .groupby(col("customer"))\
    .agg(min("order_date").alias("min_date"))\
    .withColumn("year_month",substring(col("min_date"),pos=1,len=7))\
    .groupby(col("year_month"))\
    .agg(count("customer").alias("count"))\
    .show()

