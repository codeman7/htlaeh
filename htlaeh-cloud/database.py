import MySQLdb
import os

host = 'localhost'
user = 'root'
password = 'pass'

CLOUDSQL_PROJECT = '<your-project-id>'
CLOUDSQL_INSTANCE = '<your-cloud-sql-instance>'

class Database:
    def connectToDB(self):
        #For connecting to the cloudsql on app engine
        if os.getenv('SERVER_SOFTWARE', '').startswith('Google App Engine/'):
            db = MySQLdb.connect(unix_socket='/cloudsql/{}:{}'.format(
            CLOUDSQL_PROJECT, CLOUDSQL_INSTANCE
            ), user='root')
        # For connecting on the local machine
        else:
            db = MySQLdb.connect(host=host, user=user, passwd=password)

        cursor = db.cursor()
        return cursor
