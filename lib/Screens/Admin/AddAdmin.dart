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

class AddAdmin extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: AddAdminPage(title: 'Add Admin'),
    );
  }
}
class AddAdminPage extends StatefulWidget{
  AddAdminPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  AddAdminState createState() => AddAdminState();

}
class AddAdminState extends State<AddAdminPage>{

  final unamecontroller = TextEditingController();
  final idcontroller = TextEditingController();
  final DatabaseReference aref =
      FirebaseDatabase.instance.reference().child("Admins");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
        title: Text(widget.title,),
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
                  controller: unamecontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    labelText: 'User Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.black,
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.perm_identity),
                    labelText: 'Id Number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0),                      
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text("Add",style: TextStyle(fontSize: 16),),
                  textColor: Colors.white,
                  color: Colors.lightBlue[700],
                  onPressed: () {
                    aref.child(idcontroller.text.toString().trim()).set({
                      'username': unamecontroller.text.toString().trim(),
                      'id': idcontroller.text.toString().trim(),
                    });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                    return AlertDialog(
                    title: new Text('Admin Added'),
                    actions: <Widget>[
                    FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      ),
                    ],
                    );
                  },
                  );
                }
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text("Cancel",style: TextStyle(fontSize: 16)),
                  textColor: Colors.white,
                  color: Colors.purple[300],
                  onPressed: () {
                    unamecontroller.clear();
                    idcontroller.clear();
                  },
                ),
              ),
              ])
            ],
          ),
        ),
    ),
    );
  }
}