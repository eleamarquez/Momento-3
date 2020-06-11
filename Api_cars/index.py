from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import random

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="carsapp"
)

app = Flask(__name__)

@app.route('/read')
def read():
  sql = "SELECT * FROM cars"
  cur = mydb.cursor()
  cur.execute(sql)
  result = cur.fetchall()
  print(result)
  imagenL = ["auto1.png","auto2.jpg","auto3.jpg","auto4.jpg","auto5.jpg","camioneta1.jpg","camioneta2.jpg","camioneta3.jpg","camioneta4.jpg","camioneta5.jpg"]
  indice=random.randrange(len(imagenL))
  imagenL=imagenL[indice]
  print(indice,imagenL)
  return render_template('home.html', tasks = result)

@app.route('/create')
def create():
  from random import choice
  return render_template('create-cars.html')

@app.route('/add', methods=['POST'])
def add():
  name = request.form['carName']
  brand = request.form['carBrand']
  color = request.form['carColor']
  price = request.form['carPrice']
  category = request.form['carCategory']
  sql = f"INSERT INTO cars (name, brand, color, price, category) VALUES ('{name}','{brand}','{color}','{price}','{category}')"
  cur = mydb.cursor()
  cur.execute(sql)
  mydb.commit()
  imagenC = ["auto1.png","auto2.jpg","auto3.jpg","auto4.jpg","auto5.jpg","camioneta1.jpg","camioneta2.jpg","camioneta3.jpg","camioneta4.jpg","camioneta5.jpg"]
  indice=random.randrange(len(imagenC))
  imagenC=imagenC[indice]
  print(indice,imagenC)
  return redirect(url_for('read'))

@app.route('/edit')
def edit():
  id = request.args.get('id')
  sql = f"SELECT * FROM cars WHERE id={id}"
  cur = mydb.cursor()
  cur.execute(sql)
  result = cur.fetchall()
  return render_template('edit-cars.html', task = result[0])

@app.route('/update', methods = ['POST'])
def update():
  id = request.args.get('id')
  name = request.form['carName']
  brand = request.form['carBrand']
  color = request.form['carColor']
  price = request.form['carPrice']
  category = request.form['carCategory']
  sql = f"UPDATE  cars set name = '{name}', brand = '{brand}', color = '{color}', price = '{price}', category = '{category}' WHERE id={id}"
  cur = mydb.cursor()
  cur.execute(sql)
  mydb.commit()
  return redirect(url_for('read'))

@app.route('/delete')
def delete():
  id = request.args.get('id')
  sql = f"DELETE FROM cars WHERE id={id}"
  cur = mydb.cursor()
  cur.execute(sql)
  mydb.commit()
  return redirect(url_for('read'))


if __name__ == "__main__":
    app.run(debug=True)