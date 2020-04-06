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

class AdminsFacultyList extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(
      );
  }
}
class AdminsFacultyListPage extends StatefulWidget{
  AdminsFacultyListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyAdminsFacultyListPageState createState() => MyAdminsFacultyListPageState();

}
class MyAdminsFacultyListPageState extends State<AdminsFacultyListPage>{
  List<String> names=new List();
  @override
  void initState() {
    super.initState();
      final DatabaseReference aref =
      FirebaseDatabase.instance.reference().child("Faculty");
      names.clear();
    aref.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
          aref.child(key).once().then((DataSnapshot dsnapshot){
                  Map<dynamic, dynamic> vvalues = dsnapshot.value;
                  vvalues.forEach((kkey,vvalues){
                    if(!names.contains(kkey))
                      names.add(kkey);
                  });

          });
    }); 
      setState(() {
        print('length: $names.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(names);
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
                              trailing: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                                  FirebaseDatabase.instance.reference().child("Faculty").
                                    once().then((DataSnapshot snapshot){
                                    Map<dynamic, dynamic> values = snapshot.value;
                                    values.forEach((key,values) {
                                        FirebaseDatabase.instance.reference().child("Faculty").child(key).once().then((DataSnapshot dsnapshot){
                                                Map<dynamic, dynamic> vvalues = dsnapshot.value;
                                                vvalues.forEach((kkey,vvalues){
                                                  if(kkey.compareTo(entry)==0){
                                                    // print(entry+" "+kkey);
                                                    FirebaseDatabase.instance.reference().child("Faculty").child(key).child(entry).remove();
                                                  }
                                                });

                                        });
                                  });
                                  });
                              },  
                              child:Container(
                                    child:Icon(Icons.delete),
                                  ))
                                ),
                            ],
                            
                          ))
                          ),    
          ),
          Padding(padding: EdgeInsets.only(bottom: 10))
            ])).toList(),
    ),
        ]),

    );}
}
