from pyspark.sql import SparkSession
from pyspark.sql.functions import lit,col,lead,row_number
from pyspark.sql.window import Window

spark = SparkSession \
        .builder \
        .config("spark.jars",
                "/Users/sahilnagpal/Downloads/mysql-connector-java-8.0.29.jar") \
        .master("local[*]") \
        .appName("leetcode-problems") \
        .getOrCreate()


flights = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "flights") \
    .option("user", "root") \
    .option("password", "password") \
    .load()

flights.show()

windowSpec = Window.partitionBy("cid").orderBy("fid")

flights\
    .withColumn("next_origin",lead("origin").over(windowSpec))\
    .withColumn("next_dest",lead("Destination").over(windowSpec))\
    .filter(col("Destination")==col("next_origin"))\
    .select("cid","origin",col("next_dest").alias("dest"))\
    .show()