
import 'package:flutter/material.dart';
import 'package:mproject/Screens/Visitor/gps.dart';
import 'package:mproject/Screens/Visitor/topics.dart';
import 'package:mproject/Screens/Login/Login.dart';

String ttext="";
class Visitor extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(

    );
  }
}
class VisitorPage extends StatefulWidget{
    final String text;
  VisitorPage({Key key, @required this.text}) : super(key: key);


  @override
  _MyVisitorPageState createState() => _MyVisitorPageState(text);

}
class _MyVisitorPageState extends State<VisitorPage>{

  String text;
  _MyVisitorPageState(this.text);
  
  @override
  Widget build(BuildContext context) {
    ttext=text;
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
        title: Text("Visitor feedback"),
    ),
    body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 40.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
                name: "Feedback",
                description: "For college",
                image: "feedback_icon.png",
                ),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,40.0),),
            ProductBox(
                name: "Location",
                description: "your location",
                image: "location_icon.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,80.0),),

            MaterialButton(
              padding: EdgeInsets.all(20),
              onPressed: (){
                  return null;
              },
              child: Column(
                children:<Widget>[
              GestureDetector(
              onTap: (){
                  Navigator.pop(context);
              },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.purple[300]),
                  child: Text('Logout',style: TextStyle(fontSize: 20, color: Colors.white,)),
                ))]),
              )
          ],
        )
    );
  }
}
class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.image})
      : super(key: key);

  final String name;
  final String description;
  final String image;

  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
        padding: EdgeInsets.all(2),
        height: 120,
        child: FlatButton(
          child: Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Image.asset("assets/" + image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Text(this.description,style: TextStyle(color: Colors.black,fontSize: 16),),
                            //Text("Price: " + this.price.toString()),
                          ],
                        )))
              ])),
          onPressed: onPressed(context),
        ));
  }

  Function onPressed(BuildContext context) {
    return this.name == 'Feedback'
            ? () => {
              if(flag==true){
                print(ttext),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TopicsPage(text: ttext)))
                }
              else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(
                    title: new Text('Your location is not in the range of college premises to give feedback'),
                  actions: <Widget>[
                  FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ],
                );
                })
            }
            }
            : () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Gps()))
                };
  }
}
