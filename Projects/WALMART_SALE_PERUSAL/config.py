from pyspark.sql.session import SparkSession


def spark_session():
    spark = SparkSession.builder.appName("WALMART").getOrCreate()
    return spark

def read_csv_file(path):
    return spark_session().read.csv(path, header=True)

def read_json_file(path):
    return spark_session().read.json(path)