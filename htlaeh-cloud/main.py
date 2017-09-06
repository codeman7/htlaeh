#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import webapp2
import MySQLdb
import os
from database import Database

host = 'localhost'
user = 'root'
password = 'pass'

CLOUDSQL_PROJECT = '<your-project-id>'
CLOUDSQL_INSTANCE = '<your-cloud-sql-instance>'

class MainHandler(webapp2.RequestHandler):
    def get(self):
        #For connecting to the cloudsql on app engine
        if os.getenv('SERVER_SOFTWARE', '').startswith('Google App Engine/'):
            db = MySQLdb.connect(unix_socket='/cloudsql/{}:{}'.format(
            CLOUDSQL_PROJECT, CLOUDSQL_INSTANCE
            ), user='root')
        # For connecting on the local machine
        else:
            db = MySQLdb.connect(host=host, user=user, passwd=password)
        cursor = db.cursor()
        cursor.execute('USE htlaeh')
        cursor.execute('SHOW TABLES')
        for a in cursor.fetchall():
            self.response.write("{}\n".format(a))

class Get(webapp2.RequestHandler):
    def get(self):
        self.response.write('A whats up')

class DefaultSetup(webapp2.RequestHandler):
    def get(self):
        database = Database()
        database = database.connectToDB()
        #self.createDatabase(database)
        self.createUser(database)
        #a.execute('CREATE DATABASE htlaeh')
        #a.execute('SHOW DATABASES')
    def createDatabase(self, db):
        db.execute('SHOW DATABASES')
        db.execute('CREATE DATABASE htlaeh')
        for c in db.fetchall():
            self.response.write('{}'.format(c))
    def createUser(self, db):
        db.execute('USE htlaeh')
        db.execute('CREATE TABLE IF NOT EXISTS Users (sessionID BIGINT, phoneNumber BIGINT)')



app = webapp2.WSGIApplication([
    ('/', MainHandler),
    ('/new', Get),
    ('/default', DefaultSetup)
], debug=True)
