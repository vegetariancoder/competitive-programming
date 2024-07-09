from pyspark.sql.session import SparkSession
import logging


def spark_session():
    spark = SparkSession.builder.appName("SHIMANO").getOrCreate()
    return spark


def read_csv_file(path):
    return spark_session().read.csv(path, header=True)


def read_json_file(path):
    return spark_session().read.json(path)


def set_logger():
    logging.basicConfig(
        filename='pyspark_app.log',
        filemode='a',
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        level=logging.INFO
    )

    return logging.getLogger('PySparkLogger')

