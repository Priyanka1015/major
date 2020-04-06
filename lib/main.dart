import 'dart:ui';

import 'package:mproject/Screens/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseApp app = FirebaseApp.configure(
  name: 'app',
  options: FirebaseOptions(
    googleAppID: '1:1063858542021:android:8ee3cb81b36a3531b827ac',
    apiKey: 'AIzaSyCpbFjLLyMaAELvKrK03BkWtsOkOpEtyBk',
    databaseURL: 'https://majorproject-1c258.firebaseio.com',
    gcmSenderID: '1063858542021',
  ),
) as FirebaseApp;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Register(title: 'Register Page'),
        );
  }
}

class Register extends StatefulWidget {
  Register({Key key, this.title}) : super(key: key);
  final String title;
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  bool visible = false;
  String msg = '';
  String dval = 'Admin';
  String holder = '';
  final emailcontroller = TextEditingController();
  final unamecontroller = TextEditingController();
  final pwordcontroller = TextEditingController();
  final idcontroller = TextEditingController();
  List<String> type = ['Admin','Visitor'];
  final DatabaseReference uref =
      FirebaseDatabase.instance.reference().child("Users");
  final DatabaseReference aref =
      FirebaseDatabase.instance.reference().child("Admins"); 
  final DatabaseReference vref =
      FirebaseDatabase.instance.reference().child("Visitors"); 

  userRegistration() {
    setState(() {
      visible = true;
    });
    if(emailcontroller.text.toString().compareTo("")==0 || unamecontroller.text.toString().compareTo("")==0 || pwordcontroller.text.toString().compareTo("")==0 || idcontroller.text.toString().compareTo("")==0){
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Fields can't be empty"),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
    }
    else{
    if (uref.child(idcontroller.text.toString().trim()) != null) {
      uref
          .child(idcontroller.text.toString().trim())
          .child('id')
          .once()
          .then((DataSnapshot snapshot) {
        print(snapshot.value);
        if (snapshot.value.toString().compareTo("null") != 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('User already exists...!'),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else if(holder.toString().compareTo("Admin")==0){
            if (aref.child(idcontroller.text.toString().trim()) != null) {
              aref
              .child(idcontroller.text.toString().trim())
              .child('id')
              .once()
              .then((DataSnapshot snapshot) {
              print(snapshot.value);
              if (snapshot.value.toString().compareTo("null") != 0) {
                uref.child(idcontroller.text.toString().trim()).set({
                'email': emailcontroller.text.toString().trim(),
                'username': unamecontroller.text.toString().trim(),
                'password': pwordcontroller.text.toString().trim(),
                'id': idcontroller.text.toString().trim(),
                'usertype': holder,
                });
                showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text('Registration Successful!!'),
                  actions: <Widget>[
                    FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    ),
                  ],
                );
                },
                );
              }
              else{
                showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text('You are not an admin!!'),
                  actions: <Widget>[
                    FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                      Navigator.of(context).pop();
                    },
                    ),
                  ],
                );
                },
                );
              }
        });  
        }
        }
        else if(holder.toString().compareTo("Visitor")==0){
            if (vref.child(idcontroller.text.toString().trim()) != null) {
              vref
              .child(idcontroller.text.toString().trim())
              .child('id')
              .once()
              .then((DataSnapshot snapshot) {
              print(snapshot.value);
              if (snapshot.value.toString().compareTo("null") != 0) {
                uref.child(idcontroller.text.toString().trim()).set({
                'email': emailcontroller.text.toString().trim(),
                'username': unamecontroller.text.toString().trim(),
                'password': pwordcontroller.text.toString().trim(),
                'id': idcontroller.text.toString().trim(),
                'usertype': holder,
                });
                showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text('Registration Successful!!'),
                  actions: <Widget>[
                    FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    ),
                  ],
                );
                },
                );
              }
              else{
                showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text('You are not a visitor!!'),
                  actions: <Widget>[
                    FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                      Navigator.of(context).pop();
                    },
                    ),
                  ],
                );
                },
                );
              }
        });  
        }
        }
        
      });
    }
    }
  }

  void getDropDownItem() {
    setState(() {
      holder = dval;
    });
  }

  @override 
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Icon(
                Icons.person_add,
                size: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Divider(
                  color: Colors.blue[200],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      // borderSide: BorderSide(
                      //   color: Colors.deepPurple,
                      // ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  controller: unamecontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    labelText: 'User Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      // borderSide: BorderSide(
                      //   color: Colors.deepPurple,
                      // ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  controller: pwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,                    
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      // borderSide: BorderSide(
                      //   color: Colors.deepPurple,
                      // ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  controller: idcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,                    
                    prefixIcon: Icon(Icons.perm_identity),
                    labelText: 'Id Number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      // borderSide: BorderSide(
                      //   color: Colors.deepPurple,
                      // ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButton<String>(
                  value: dval,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 24,
                  style:
                      TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String data) {
                    setState(() {
                      dval = data;
                    });
                  },
                  items: type.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text("Register",style: TextStyle(fontSize: 16)),
                  textColor: Colors.white,
                  color: Colors.lightBlue[700],
                  onPressed: () {
                    getDropDownItem();
                    userRegistration();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text("Cancel",style: TextStyle(fontSize: 16),),
                  textColor: Colors.white,
                  color: Colors.purple[300],
                  onPressed: () {
                    emailcontroller.clear();
                    unamecontroller.clear();
                    pwordcontroller.clear();
                    idcontroller.clear();
                  },
                ),
              ),
              ]),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: FlatButton(
                    onPressed: () {
                      emailcontroller.clear();
                      unamecontroller.clear();
                      pwordcontroller.clear();
                      idcontroller.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text("Already a user? Login here",style: TextStyle(fontSize: 16),),
                    textColor: Colors.redAccent[700],
                  )),
              Visibility(
                  visible: visible,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
