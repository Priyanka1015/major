import 'package:flutter/material.dart';
import './questionair.dart';
import 'package:mproject/Screens/Visitor/semesterlist.dart';
import 'package:mproject/Screens/Login/Login.dart';

String ttext="";
class Topics extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(

    );
  }
}
class TopicsPage extends StatefulWidget{
    final String text;
  TopicsPage({Key key, @required this.text}) : super(key: key);

  @override
  TopicsPageState createState() => TopicsPageState(text);

}
class TopicsPageState extends State<TopicsPage>{

  String text;
  TopicsPageState(this.text);

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
        title: Text("Feedback"),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 60.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
                index: 0,
                name: "Teachers",
                description: "Feedback for teachers",
                image: "teacher.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 0,
                name: "College",
                description: "Feedback for college",
                image: "college.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 1,
                name: "Canteen",
                description: "Feedback for canteen",
                image: "canteen.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),            
            ProductBox(
                index: 2,
                name: "Curricular Activities",
                description: "Feedback for Curricular Activities",
                image: "curriculum.png"),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,20.0),),
            ProductBox(
                index: 3,
                name: "Library",
                description: "Feedback for Library",
                image: "library.png"),
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
            onPressed: this.name == 'Teachers'
                ? () => {
                        Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => SemesterPage(text: ttext+"/"+"Teachers")))

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Questionair(this.index)))
                    }
                : this.name == 'College'
                    ? () => {
                      print(ttext),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Questionair(text: this.index.toString()+"/"+ttext+"/"+"College")))
                        }
                    : this.name == 'Canteen'
                    ? () => {
                          print(ttext),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Questionair(text: this.index.toString()+"/"+ttext+"/"+"Canteen")))
                        }
                    : this.name == 'Curricular Activities'
                    ? () => {
                          print(ttext),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Questionair(text: this.index.toString()+"/"+ttext+"/"+"Curricular Activities")))
                        }
                    : () => {
                          print(ttext),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Questionair(text: this.index.toString()+"/"+ttext+"/"+"Library")))
                        }
                        ));
  }
}
