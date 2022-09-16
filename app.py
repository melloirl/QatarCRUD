from flask import Flask, render_template
from backend import DataAccessObject
app = Flask(__name__)

DB = DataAccessObject.DAO('localhost','mierul23_mobi','mobilete1234','mierul23_qatar22')
@app.route("/")
def index():
    return(render_template("index.html", databaseTables = DB.updateTables()))
@app.route("/create")
def createEntity():
    return(render_template("index.html",dragao = DB.updateTables()))
@app.route("/read/<name>")
def readAll(name):
    return(render_template("search.html", headers = DB.updateTableColumnNames(name),results =DB.searchAllTableEntities(name),size = len(DB.updateTableColumnNames(name))))
@app.route("/update")
def updateEntity():
    return(render_template("index.html",dragao = DB.updateTables()))
@app.route("/delete/<table>/<id>")
def deleteEntity(table,id):
    DB.deleteEntity(table,id)
    return(render_template("index.html",dragao = DB.updateTables()))

