import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mproject/Screens/Visitor/facultylist.dart';

final FirebaseApp app = FirebaseApp.configure(
  name: 'app',
  options: FirebaseOptions(
    googleAppID: '1:1063858542021:android:8ee3cb81b36a3531b827ac',
    apiKey: 'AIzaSyCpbFjLLyMaAELvKrK03BkWtsOkOpEtyBk',
    databaseURL: 'https://majorproject-1c258.firebaseio.com',
    gcmSenderID: '1063858542021',
  ),
) as FirebaseApp;

class Semester extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(

    );
  }
}
class SemesterPage extends StatefulWidget{
    final String text;
  SemesterPage({Key key, @required this.text}) : super(key: key);


  @override
  SemesterPageState createState() => SemesterPageState(text);

}
class SemesterPageState extends State<SemesterPage>{

  String text;
  SemesterPageState(this.text);
  List<String> al=['1-1','1-2','2-1','2-2','3-1','3-2','4-1','4-2'];
  @override
  Widget build(BuildContext context) {
    print(text);
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
        title: Text('List of Semesters'),
        ),
        body: ListView(
        padding: const EdgeInsets.fromLTRB(2.0, 30.0, 2.0, 0.0),
        children: <Widget>[
         Column(
        children: al
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
                              leading: Icon(Icons.youtube_searched_for),
                              title: Text(entry, style: TextStyle(fontSize: 20),),
                              onTap: (){
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) => FacultyListPage(text: (text+"/"+entry))));
                              }),
                            ],
                            
                          ))
                          ),    
          ),
          Padding(padding: EdgeInsets.only(bottom: 10),)
            ])).toList(),
    ),
        ]),
    );
  }
}