import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="abc",
  password="password"
)
mycursor = mydb.cursor()
mycursor.execute("insert into test2.test_table values(123, 'sudh', 123.35, 456, 'kumar')")
mydb.commit()
mydb.close()