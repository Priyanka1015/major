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

class Result extends StatelessWidget {
  final int resultScore;
  final int length;
  final String text;
  final Function resetQuiz;
  Result(this.resultScore, this.resetQuiz,this.length,this.text);
  String get resultPhrase {
    //print(this.text);
    //print(text.split("/").length);
    var resultText = 'You did it';
    if (resultScore <= (length+1)) {
      resultText = 'careful';
    } else if (resultScore <= length*3) {
      resultText = 'better';
    } else {
      resultText = 'awesome';
    }

    List<String> al=text.split("/");
      final DatabaseReference uref =
      FirebaseDatabase.instance.reference().child("Feedback");
      final DatabaseReference oref =
      FirebaseDatabase.instance.reference().child("OtherFeedback");
      if(al.length>3){
        String sem=al[3];
        String fac=al[4];
        String sub=al[5];
        String tqtype=al[6];
        uref.child(fac).child(tqtype).set({
          'semester':sem,
          'subject':sub,
          'feedbackval': this.resultScore,
          'feedbackmesg': resultText
        });
      }
      else {
        String id=al[1];
        String ftype=al[2];
        oref.child(id).child(ftype).set({
          'feedbackval': this.resultScore,
          'feedbackmesg': resultText
      });
      }
      
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    print(text);
    return Scaffold(
            backgroundColor: Colors.blue[200],
      body: Column(
        children: <Widget>[
          Center(
            heightFactor: 6,
          child: Text(
            "Your Feedback is saved",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          FlatButton(
            child: Text('Reset Feedback!'),
            textColor: Colors.black,
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}