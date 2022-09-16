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


# while(True):
#     print("--------------------------")
#     print ("1 - Create")
#     print("2 - Read")
#     print("3 - Update")
#     print("4 - Delete")
#     print("--------------------------")
#     choice = int(input())

#     if choice == 1:
#         avaliable = getTables(mycursor)
#         print()
#         print("CHOSEN TABLE NAME: ",end='')
#         tabela = input()
#         needed = getTableColumnNames(mycursor,tabela)
#         print()
#         userInput = input().split()
#         for x in range(len(userInput)):
#             userInput[x] = "'" + userInput[x] + "'"
#         create = f"INSERT INTO {tabela} ({needed[:-1]}) VALUES({','.join(userInput)})"
#         print(create)
#         try:
#              mycursor.execute(create)
#              mydb.commit()
#              print(mycursor.rowcount, "RECORD INSERTED.")
#         except mysql.connector.errors.IntegrityError:
#             print("DUPLICATE PRIMARY KEY, DATABASE UNCHANGED.")
        
    
#     elif choice == 2:
#         avaliable = getTables(mycursor)
#         print()
#         print("CHOSEN TABLE NAME: ",end='')
#         tabela = input()
#         read = "SELECT * FROM " + tabela
#         mycursor.execute(read)
#         myresults = mycursor.fetchall()
#         for result in myresults:
#             for part in result:
#                 if len(str(part)) <= 20:
#                     print(part,end=',')
#             print()

#     elif choice == 3:
#         pass
#     elif choice == 4:
#         pass
#     else:
#         break



# read = "SELECT * FROM SELECAO"

# mycursor.execute(read)

# myresult = mycursor.fetchall()

# for x in myresult:
#     print(x[0:4])