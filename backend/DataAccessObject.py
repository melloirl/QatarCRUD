import mysql.connector

class DAO:
    def __init__(self,host,user,password,database):
        self.mydb = mysql.connector.connect(
        host = host,
        user = user,
        password = password,
        database = database
        )
        self.database = database
        self.cursor = self.mydb.cursor()
        self.avaliableTables = self.updateTables()

    def updateTables(self):
        self.cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'mierul23_qatar22' ")
        avaliable = self.cursor.fetchall()
        return avaliable
    
    def updateTableColumnNames(self,tableName):
        self.cursor.execute(f"SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{tableName}'ORDER BY ORDINAL_POSITION")
        avaliable = self.cursor.fetchall()
        return avaliable
    
    def searchAllTableEntities(self,tableName):
        self.cursor.execute(f"SELECT * FROM {tableName}")
        results = self.cursor.fetchall()
        return results
    
    def getKeys(self,tableName):
        self.cursor.execute(f"SHOW INDEXES IN {tableName}")
        keys = self.cursor.fetchall()
        return keys

    def deleteEntity(self,tableName,id):
        keys = self.getKeys(tableName)
        delete = f'{tableName}.{keys[0]}'
        print(delete)
        self.cursor.execute(f"DELETE FROM {tableName} WHERE {tableName}.{keys[0]}={id}")
    
    def getColumnTypes(self,tableName):
        self.cursor.execute(f"SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{tableName}'ORDER BY ORDINAL_POSITION")
        avaliable = self.cursor.fetchall()
        return avaliable
