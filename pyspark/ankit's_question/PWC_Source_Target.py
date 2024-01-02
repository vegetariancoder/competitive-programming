from pyspark.sql import SparkSession
from pyspark.sql.functions import lit,col

spark = SparkSession \
        .builder \
        .config("spark.jars",
                "/Users/sahilnagpal/Downloads/mysql-connector-java-8.0.29.jar") \
        .master("local[*]") \
        .appName("leetcode-problems") \
        .getOrCreate()


source = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "source") \
    .option("user", "root") \
    .option("password", "password") \
    .load()


target = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "target") \
    .option("user", "root") \
    .option("password", "password") \
    .load()


source_df = source\
 .join(target,source.id == target.id,"leftanti")\
 .withColumn("comment",lit("New in source"))\
 .select("id","comment")

target_df = target\
 .join(source,target.id == source.id,"leftanti")\
 .withColumn("comment",lit("New in target"))\
 .select("id","comment")

source = source\
 .withColumnRenamed("id","source_id")\
 .withColumnRenamed("name","source_name")


mismatch_df = source\
 .join(target,source.source_id == target.id,"inner")\
 .where(col("source_name")!=col("name"))\
 .withColumn("comment",lit("Mismatch"))\
 .select(col("source_id").alias("id"),"comment")

source_df\
 .unionByName(target_df)\
 .unionByName(mismatch_df)\
 .show()

