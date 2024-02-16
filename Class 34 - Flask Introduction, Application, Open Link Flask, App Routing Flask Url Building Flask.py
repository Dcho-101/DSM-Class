from flask import Flask #helps to expose function to the outer world
from flask import request


app = Flask(__name__) # creating a variable 'app'

@app.route("/") # decorate and provides the route for accessing function, (/) slash means default location in the server.
def hello_world():
    return "<h1>Hello, World!</h1>"

@app.route("/hello_world1") # decorate and provides the route for accessing function 
def hello_world1():
    return "<h1>Hello, World1!</h1>"

@app.route("/hello_world2") # decorate and provides the route for accessing function 
def hello_world2():
    return "<h1>Hello, World2!</h1>"


@app.route("/test")
def test() :
    a = 5+6
    return "this is my function to run an app. {}".format(a)

# creating a function which can take an input and returns values
# for that you need to import request from flask. which made above

@app.route('/test2')
def test2() :
    data = request.args.get('x') #all the x input it will capture # it takes all the arguments
    return "this is a data input from my url {}".format(data)



if __name__=="__main__":
    app.run(host="0.0.0.0")






