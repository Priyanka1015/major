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

class VisitorsList extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(
      );
  }
}
class VisitorsListPage extends StatefulWidget{
  VisitorsListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyVisitorsListPageState createState() => MyVisitorsListPageState();

}
class MyVisitorsListPageState extends State<VisitorsListPage>{
  List<String> vnames=new List();
  @override
  void initState() {
    super.initState();
      final DatabaseReference aref =
      FirebaseDatabase.instance.reference().child("Users");
      vnames.clear();
    aref.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        if(values["usertype"]=="Visitor")
          vnames.add(values["username"]);
    }); 
      setState(() {
        print('length: $vnames.length');
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
        title: Text('Admins List'),
        ),
        body:ListView(
        padding: const EdgeInsets.fromLTRB(2.0, 30.0, 2.0, 0.0),
        children: <Widget>[
         Column(
        children: vnames
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
                                  FirebaseDatabase.instance.reference().child("Users")
                                  .once().then((DataSnapshot snapshot){
                                  Map<dynamic, dynamic> values = snapshot.value;
                                  values.forEach((key,values) {
                                  if(values["username"].toString().compareTo(entry)==0){
                                      print(values['id']);
                                      FirebaseDatabase.instance.reference().child("Visitors").child(values['id'].toString()).remove();
                                      FirebaseDatabase.instance.reference().child("Users").child(values['id'].toString()).remove();
                                  }
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