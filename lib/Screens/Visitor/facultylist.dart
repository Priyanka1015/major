import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mproject/Screens/Visitor/subjectlist.dart';

final FirebaseApp app = FirebaseApp.configure(
  name: 'app',
  options: FirebaseOptions(
    googleAppID: '1:1063858542021:android:8ee3cb81b36a3531b827ac',
    apiKey: 'AIzaSyCpbFjLLyMaAELvKrK03BkWtsOkOpEtyBk',
    databaseURL: 'https://majorproject-1c258.firebaseio.com',
    gcmSenderID: '1063858542021',
  ),
) as FirebaseApp;

class FacultyList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    );
  }
}
class FacultyListPage extends StatefulWidget{
  FacultyListPage({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  FacultyListPageState createState() => FacultyListPageState(text);

}
class FacultyListPageState extends State<FacultyListPage>{
  String text;
  FacultyListPageState(this.text);
  List<String> names=new List();

  @override
  void initState() {
    super.initState();
      print(text);
      List<String> al=text.split("/");
      final DatabaseReference uref =
      FirebaseDatabase.instance.reference().child("Faculty").child(al[2]);
    uref.once().then((DataSnapshot snapshot){
        var keys= snapshot.value.keys;
        names.clear();
        for(String key in keys){
          names.add(key.toString());
        } 
        //print(names);  
      setState(() {
        print('length: $names.length');
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {

    //print(text); 
    //print(names);
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
        title: Text('Faculty List'),
        ),
        body:ListView(
        padding: const EdgeInsets.fromLTRB(2.0, 30.0, 2.0, 0.0),
        children: <Widget>[
         Column(
        children: names
          .map((entry) => Column(
            children: <Widget>[
           Container(
          padding: EdgeInsets.all(5),
            color: Colors.black, 
            child: Card(
              child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Mr/Mrs. "+entry, style: TextStyle(fontSize: 20),),
                              onTap: (){
                                  print(text+"/"+entry);
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) => SubjectListPage(text: (text+"/"+entry))));
                              }),
                            ],
                            
                          ))
                          ),    
          ),
          Padding(padding: EdgeInsets.only(bottom: 10))
            ])).toList(),
    ),
        ]),

    );
  }
}