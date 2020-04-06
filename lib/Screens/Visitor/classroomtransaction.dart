import 'package:flutter/material.dart';
import './TQuestionair.dart';
import 'package:mproject/Screens/Login/Login.dart';

String ttext="";
class ClassTrans extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(

    );
  }
}
class ClassTransPage extends StatefulWidget{
    final String text;
  ClassTransPage({Key key, @required this.text}) : super(key: key);

  @override
  ClassTransPageState createState() => ClassTransPageState(text);

}
class ClassTransPageState extends State<ClassTransPage>{

  String text;
  ClassTransPageState(this.text);

  @override
  Widget build(BuildContext context) {
    flag=false;
    ttext=text;
    return Scaffold(
      backgroundColor: Colors.blue[200],
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
        title: Text("Feedback for teachers"),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 20.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
                index: 0,
                name: "Interaction",
                description: "Communication",
                image: "interaction.jpg"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 1,
                name: "Explore",
                description: "Teacher's progress?",
                image: "explore.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 2,
                name: "Explanation",
                description: "knowledge on subject",
                image: "explain.jpg"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),            
            ProductBox(
                index: 3,
                name: "Elaborate",
                description: "Innovation with concepts",
                image: "innovate.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 4,
                name: "Evaluate",
                description: "Focus on students progress?",
                image: "evaluate.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 5,
                name: "Class Control",
                description: "Teacher's Control mechanism",
                image: "control.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 6,
                name: "General Teacher attitude",
                description: "Positive or negative draining",
                image: "attitude.webp"),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.image, this.index})
      : super(key: key);

  final String name;
  final String description;
  final String image;
  final int index;
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.all(2),
        height: 100,
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
                              Text(this.description,style: TextStyle(fontSize:16),),
                              //Text("Price: " + this.price.toString()),
                            ],
                          )))
                ])),
            onPressed: this.name == 'Interaction'
                ? () => {
                        Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => TQuestionair(text: this.index.toString()+"/"+ttext+"/"+"Interaction")))

                    }
                : this.name == 'Explore'
                    ? () => {
                      print(ttext),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TQuestionair(text: this.index.toString()+"/"+ttext+"/"+"Explore")))
                        }
                    : this.name == 'Explanation'
                    ? () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TQuestionair(text: this.index.toString()+"/"+ttext+"/"+"Explanation")))
                        }
                    : this.name == 'Elaborate'
                    ? () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TQuestionair(text: this.index.toString()+"/"+ttext+"/"+"Elaborate")))
                        }
                    : this.name == 'Evaluate'
                    ? () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TQuestionair(text: this.index.toString()+"/"+ttext+"/"+"Evaluate")))
                        }
                    : this.name == 'Class Control'
                    ? () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TQuestionair(text: this.index.toString()+"/"+ttext+"/"+"Class Control")))
                        }   
                    : () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TQuestionair(text: this.index.toString()+"/"+ttext+"/"+"General Teacher attitude")))
                        }
                        ));
  }
}
