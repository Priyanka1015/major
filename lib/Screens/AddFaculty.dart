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

class AddFaculty extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold( 
      body: AddFacultyPage(title: 'Add Faculty'),
    );
  }
}
class AddFacultyPage extends StatefulWidget{
  AddFacultyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  AddFacultyState createState() => AddFacultyState();

}
class AddFacultyState extends State<AddFacultyPage>{

  String dval = '1-1';
  String holder = '';
  List<String> type = ['1-1', '1-2','2-1','2-2','3-1','3-2','4-1','4-2'];
  final unamecontroller = TextEditingController();
  final idcontroller = TextEditingController();
  final DatabaseReference fref =
      FirebaseDatabase.instance.reference().child("Faculty");
  final DatabaseReference sref =
      FirebaseDatabase.instance.reference().child("Subject");
  final DatabaseReference fsref =
      FirebaseDatabase.instance.reference().child("FacultySubjects");

    void getDropDownItem() {
    setState(() {
      holder = dval;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],    
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
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
                  controller: unamecontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,                    
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Faculty Name',
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
                    labelText: 'Subject Name',
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
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: DropdownButton<String>(
                  value: dval,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 24,
                  style:
                      TextStyle(color: Colors.black, fontSize: 20),
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
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: MaterialButton(
                  child: Text("Add",style: TextStyle(fontSize: 16),),
                  textColor: Colors.white,
                  color: Colors.lightBlue[700],
                  onPressed: () {
                    getDropDownItem();
                    fref.child(holder).child(unamecontroller.text.toString().trim()).set({
                      'facname': unamecontroller.text.toString().trim(),
                    });
                  sref.child(holder).child(idcontroller.text.toString().trim()).set({
                    'subname': idcontroller.text.toString().trim(),
                  });
                  fsref.child(holder).child(unamecontroller.text.toString().trim()).child(idcontroller.text.toString().trim()).set({
                    'facname': unamecontroller.text.toString().trim(),
                    'subname': idcontroller.text.toString().trim(),
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                    return AlertDialog(
                    title: new Text('Faculty Added'),
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
              ]),
            ],
        ),
    ),
    ),
    );
  }
}