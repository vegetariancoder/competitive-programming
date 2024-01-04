from pyspark.sql import SparkSession
from pyspark.sql.functions import sum,col,concat,lit

spark = SparkSession \
        .builder \
        .config("spark.jars",
                "/Users/sahilnagpal/Downloads/mysql-connector-java-8.0.29.jar") \
        .master("local[*]") \
        .appName("leetcode-problems") \
        .getOrCreate()


clocked_hours = spark.read.format("jdbc"). \
    option("url", "jdbc:mysql://localhost:3306/online") \
    .option("driver", "com.mysql.cj.jdbc.Driver") \
    .option("dbtable", "clocked_hours") \
    .option("user", "root") \
    .option("password", "password") \
    .load()

in_df = clocked_hours\
    .filter(col("flag")=='I')\
    .groupby(col("empd_id"))\
    .agg(sum("swipe").alias("sm_punchin"))

out_df = clocked_hours\
    .withColumnRenamed("empd_id","out_empd_id")\
    .filter(col("flag")=='O')\
    .groupby(col("out_empd_id"))\
    .agg(sum("swipe").alias("sm_punchout"))

in_df\
    .join(out_df,in_df.empd_id==out_df.out_empd_id,"inner")\
    .withColumn("difference",col("sm_punchout")-col("sm_punchin"))\
    .withColumn('hours', col('difference') / 3600)\
    .select("empd_id",col("hours").cast("integer"))\
    .show()