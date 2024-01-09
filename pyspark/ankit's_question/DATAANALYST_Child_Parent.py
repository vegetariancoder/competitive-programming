from pyspark.sql import SparkSession
from pyspark.sql.functions import col,max,when

spark = SparkSession \
        .builder \
        .config("spark.jars",
                "/Users/sahilnagpal/Downloads/mysql-connector-java-8.0.29.jar") \
        .master("local[*]") \
        .appName("leetcode-problems") \
        .getOrCreate()


people = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "people") \
    .option("user", "root") \
    .option("password", "password") \
    .load()

relations = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "relations") \
    .option("user", "root") \
    .option("password", "password") \
    .load()

people.show()
relations.show()


people\
    .join(other=relations,
          on=people.id == relations.p_id,
          how="inner"
          )\
    .select("c_id","name","gender")\
    .withColumn("Father",when(col("gender")=='M',col("name")).otherwise(None))\
    .withColumn("Mother",when(col("gender")=='F',col("name")).otherwise(None))\
    .drop("name","gender")\
    .groupby("c_id")\
    .agg(max("Father").alias("Father"),
         max("Mother").alias("Mother"))\
    .show()