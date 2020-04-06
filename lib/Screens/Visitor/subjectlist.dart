import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mproject/Screens/Visitor/TQuestionair.dart';
import 'package:mproject/Screens/Visitor/classroomtransaction.dart';
import 'package:mproject/Screens/Visitor/questionair.dart';

final FirebaseApp app = FirebaseApp.configure(
  name: 'app',
  options: FirebaseOptions(
    googleAppID: '1:1063858542021:android:8ee3cb81b36a3531b827ac',
    apiKey: 'AIzaSyCpbFjLLyMaAELvKrK03BkWtsOkOpEtyBk',
    databaseURL: 'https://majorproject-1c258.firebaseio.com',
    gcmSenderID: '1063858542021',
  ),
) as FirebaseApp;

class SubjectList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    );
  }
}
class SubjectListPage extends StatefulWidget{
  SubjectListPage({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  SubjectListPageState createState() => SubjectListPageState(text);

}
class SubjectListPageState extends State<SubjectListPage>{
  String text;
  SubjectListPageState(this.text);
  List<String> subs=new List();

  @override
  void initState() {
    super.initState();
      List<String> al=text.split("/");
      final DatabaseReference uref =
      FirebaseDatabase.instance.reference().child("FacultySubjects").child(al[2]).child(al[3]);
    uref.once().then((DataSnapshot snapshot){
        var keys= snapshot.value.keys;
        subs.clear();
        for(String key in keys){
          subs.add(key.toString());
        } 
        print(subs);
        //print(names);  
      setState(() {
        print('length: $subs.length');
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[200],
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
        title: Text('Subject List'),
        ),
        body:ListView(
        padding: const EdgeInsets.fromLTRB(2.0, 30.0, 2.0, 0.0),
        children: <Widget>[
         Column(
        children: subs
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
                              title: Text(entry, style: TextStyle(fontSize: 20),),
                              onTap: (){
                                    print(text+"/"+entry);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ClassTransPage(text: text+"/"+entry)));
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