
import 'package:flutter/material.dart';
import 'package:mproject/Screens/Admin/AddAdmin.dart';
import 'package:mproject/Screens/Visitor/AddVisitor.dart';
import 'package:mproject/Screens/AddFaculty.dart';
import 'package:mproject/Screens/AddSubject.dart';
import 'package:mproject/Screens/Admin/VisitorsList.dart';
import 'package:mproject/Screens/Admin/AdminsList.dart';
import 'package:mproject/Screens/Admin/AdminsFacultyList.dart';
import 'package:mproject/Screens/Admin/AdminsSubjectList.dart';





class AdminPage extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _AdminPage(title: 'Admin page'),
      );
  }
}
class _AdminPage extends StatefulWidget{
  _AdminPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAdminPageState createState() => _MyAdminPageState();

}
class _MyAdminPageState extends State<_AdminPage>{

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
    child: Column(
      children: <Widget>[
      Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddAdmin()),
                      );
            },
            child: Container(
              margin: EdgeInsets.only(left: 10,top: 30,right:10,bottom: 30),
              padding: EdgeInsets.all(20),
              alignment: Alignment(0.0,0.0),
              constraints: BoxConstraints.expand(height: 180, width: 190),
              decoration: BoxDecoration(color: Colors.black,
              //shape: BoxShape.circle
              ),
              
              child: Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              
                              title: Text("Add Admin",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              )
                            ],
                            
                          ))
              )
            )),
            GestureDetector(
              onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminsListPage()),
                      );
              }, 
              child: Container(
                margin: EdgeInsets.only(top: 30,bottom:30),
                padding: EdgeInsets.all(20),
                alignment: Alignment(0.0,0.0),
                constraints: BoxConstraints.expand(height: 180, width: 190),
                decoration: BoxDecoration(color: Colors.black,
                //shape: BoxShape.circle
                ),
                child: Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              title: Text("Admins List",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              )
                            ],
                            
                          ))
              )
              )),
            ],),
            Row(
              children: <Widget>[
            GestureDetector(
            onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddVisitor()),
                      );
            },
            child: Container(
              margin: EdgeInsets.only(left: 10,top: 30,right:10,bottom:30),
              padding: EdgeInsets.all(20),
              alignment: Alignment(0.0,0.0),
              constraints: BoxConstraints.expand(height: 180, width: 190),
              decoration: BoxDecoration(color: Colors.black,
              //shape: BoxShape.circle
              ),
              child: Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              title: Text("Add Visiting Officer" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                              )
                            ],
                            
                          ))
              )
            )),
            GestureDetector(
              onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VisitorsListPage()),
                      );
              },
              child: Container(
                margin: EdgeInsets.only(top: 30,bottom: 30),
                padding: EdgeInsets.all(20),
                alignment: Alignment(0.0,0.0),
                constraints: BoxConstraints.expand(height: 180, width: 190),
                decoration: BoxDecoration(color: Colors.black,
                //shape: BoxShape.circle
                ),
                child:  Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              title: Text("Visitors List",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              )
                            ],
                            
                          ))
              )
              )),
              ],),
              Row(
              children: <Widget>[
          
              GestureDetector(
              onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddFaculty()),
                      );
              }, 
              child: Container(
                margin: EdgeInsets.only(left: 10,top: 30,right:10,bottom:30),
                padding: EdgeInsets.all(20),
                alignment: Alignment(0.0,0.0),
                constraints: BoxConstraints.expand(height: 180, width: 190),
                decoration: BoxDecoration(color: Colors.black,
                //shape: BoxShape.circle
                ),
                child: Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              title: Text("Add Faculty",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              )
                            ],
                            
                          ))
              )
              )),
              GestureDetector(
              onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminsFacultyListPage()),
                      );
              },
              child: Container(
                margin: EdgeInsets.only(top: 30,bottom: 30),
                padding: EdgeInsets.all(20),
                alignment: Alignment(0.0,0.0),
                constraints: BoxConstraints.expand(height: 180, width: 190),
                decoration: BoxDecoration(color: Colors.black,
                //shape: BoxShape.circle
                ),
                child:  Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              title: Text("Faculty List",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              )
                            ],
                            
                          ))
              )
              )),
              ],), 
              Row(
              children: <Widget>[
              GestureDetector(
              onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddSubject()),
                      );
              },
              child: Container(
                margin: EdgeInsets.only(left:10, right:10, top: 30,bottom: 60),
                padding: EdgeInsets.all(20),
                alignment: Alignment(0.0,0.0),
                constraints: BoxConstraints.expand(height: 180, width: 190),
                decoration: BoxDecoration(color: Colors.black,
                //shape: BoxShape.circle
                ),
                child:  Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              title: Text("Add Subjects",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              )
                            ],
                            
                          ))
              )
              )),
              GestureDetector(
              onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminsSubjectListPage()),
                      );
              },
              child: Container(
                margin: EdgeInsets.only(top: 30,bottom: 60),
                padding: EdgeInsets.all(20),
                alignment: Alignment(0.0,0.0),
                constraints: BoxConstraints.expand(height: 180, width: 190),
                decoration: BoxDecoration(color: Colors.black,
                //shape: BoxShape.circle
                ),
                child:  Card(
                child: Container(
                padding: EdgeInsets.all(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                              title: Text("Subjects List",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                              )
                            ],
                            
                          ))
              )
              )),
              ],),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              MaterialButton(
              padding: EdgeInsets.all(16),
                child: Text('Logout',style: TextStyle(fontSize: 16),),
                textColor: Colors.white,
                color: Colors.purple[300],
                onPressed: (){
                  Navigator.pop(context);
                },
              )
              ]), 
              Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,120.0),), 
      ]
    ),
    ),
    );
    }
}