import 'dart:ui';

import 'package:mproject/Screens/Admin/AdminPage.dart';
import 'package:mproject/Screens/Visitor/VisitorPage.dart';
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

bool flag=false;
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    flag=false;
    return new Scaffold(
        body: MyLoginPage(title: 'Login Page'),
        );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  
  String dval = 'Admin';
  String msg = '';
  String holder = '';
  final emailcontroller = TextEditingController();
  final pwordcontroller = TextEditingController();
  final idcontroller = TextEditingController();
  List<String> type = ['Admin', 'Visitor'];
  final DatabaseReference uref =
      FirebaseDatabase.instance.reference().child("Users");

  void getDropDownItem() {
    setState(() {
      holder = dval;
    });
  }

  userLogin() {
    if (uref.child(idcontroller.text.toString().trim()) != null) {
      uref
          .child(idcontroller.text.toString().trim())
          .child('id')
          .once()
          .then((DataSnapshot snapshot) {
            print(snapshot.value);
        if (snapshot.value.toString().compareTo(idcontroller.text.toString().trim())!=0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('Invalid User'),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        }
        else{
          uref
          .child(idcontroller.text.toString().trim())
          .child('email')
          .once()
          .then((DataSnapshot snapshot) {
            print(snapshot.value);
        if (snapshot.value.toString().compareTo(emailcontroller.text.toString().trim())!=0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('Enter correct details..!'),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        }
        else{
          uref
          .child(idcontroller.text.toString().trim())
          .child('password')
          .once()
          .then((DataSnapshot snapshot) {
            print(snapshot.value);
        if (snapshot.value.toString().compareTo(pwordcontroller.text.toString().trim())!=0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('Enter correct details..!'),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        }
        else{
          uref
          .child(idcontroller.text.toString().trim())
          .child('usertype')
          .once()
          .then((DataSnapshot snapshot) {
            print(snapshot.value);
        if (snapshot.value.toString().compareTo(holder)!=0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('You have registered as a different user!!'),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        }
        else{
          if(holder.compareTo("Admin")==0){
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminPage()),
                      );
          }
          else{
            print(idcontroller.text.toString().trim());
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VisitorPage(text: idcontroller.text.toString().trim())),
                      );
          }
        }
        });
        }
        });
        }
        });
        }
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
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
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,                    
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  controller: idcontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,                    
                    prefixIcon: Icon(Icons.perm_identity),
                    labelText: 'Id Number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextField(
                  controller: pwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,                    
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
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
                  child: Text("Login",style: TextStyle(fontSize: 16)),
                  textColor: Colors.white,
                  color: Colors.lightBlue[700],
                  onPressed: () {
                    getDropDownItem();
                    userLogin();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text("Cancel",style: TextStyle(fontSize: 16)),
                  textColor: Colors.white,
                  color: Colors.purple[300],
                  onPressed: () {
                    emailcontroller.clear();
                    idcontroller.clear();
                    pwordcontroller.clear();
                  },
                ),
              ),
              ]
              ),

              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Not registered? Register here",style: TextStyle(fontSize: 16)),
                    textColor: Colors.redAccent[700],
                  )),
            ],
          ),
        ),
      ),
      
    );
  }
}
