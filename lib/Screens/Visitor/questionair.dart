import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }
class Qt extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Scaffold(
    );
  }
}
class Questionair extends StatefulWidget {
    final String text;
  Questionair({Key key, @required this.text}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState(text);
}

//void main() =>runApp(MyApp());
class _MyAppState extends State<Questionair> {
  final String text;
  _MyAppState(this.text);
  
  String index="";

  @override
  void initState() {
    super.initState();
      List<String> al=text.split("/");
      index=al[0];
  }

  final _questions = const [
    // 'What\'s your favorite color?',
    // 'What\'s your favorite animal?',

    {'topic': 'college', 'q': [
      'Are you satisfied with the teaching staff and their teaching methods',
      'How satisfied are you with the facilities provided by the college',
      'Was it easy to obatin the necessary resources from the college library',
      'How satisfied are you with the cleanliness',
      'How satisfies are you with the cleaning of washrooms',
      'How satisfied are you with the food provided in the caffeteria',
      'Do you feel it is easy to register to different courses in the college',
      'Does out R&D spacious and contains latest equipment and software to work on new and emerging projects',
      'did you like our new products designed by our students?',
      'Rate your overall experience in our college',
      'check'
    ]},
    {'topic': 'canteen', 'q': [
      'Rate the atmosphere of the cafeteria',
      'Does the canteen provide breakfast to students?',
      'Does the college offer brand-name fast foods from companies such as Pizza Hut, Taco Bell,or Subway?',
      'Did the food provided satify your taste?',
      'Are you satisfied with the ambience of the canteen?',
      'How satisfied are you with the serivice provided by the canteen?',
      'how satisfied are you with the canteen availability of healthy food options?',
      'Do you find our canteen sapacious',
      'Do you think our menu reaches certain nutritional values?',
      'Overall rating to our caffeteria',
      'check'
    ]},
    {'topic': 'curricular activities', 'q': [
      'Did u visit our clubs',
      'Do you find the interests of our students satisfied in the name of clubs',
      'How satisfied are you with the maintanence of these club rooms',
      'What do you think about the weekly club activities and weekly club programmes',
      'Do you think our clubs can be stress busters',
      'Do you fing the recruitment process of these clubs fair?',
      'Do you find our fests pocket friendly',
      'Are u satisfied with the social programmes arranged by our college',
      'Do you think these social programmes will make our students better citizens',
      'Overall rating to our curricular activities',
      'check'

    ]}   ,
    {'topic': 'library', 'q': [
      'Do you find our library spacious',
      'Was it easy to search for a book',
      'How about the availability of staff to help in the library?',
      'How are the servicesprovide by the librarian and other library staff',
      'How satisfies are you with our digital library',
      'Do you think comics,novel etc placed in our library will help our students to relieve stress',
      'Would you suggest us more fun books to place in the library',
      'Rate the cleanliness of our library',
      'Rate the equipment and ambience of our library',
      'Rate the book collection of our library',
      'check'
    ]},
    {'topic': '', 'q':[]},
    {'topic': '', 'q':[]},
    {'topic': '', 'q':[]},
    {'topic': '', 'q':[]},
    {'topic': '', 'q':[]},
    {'topic': '', 'q':[]}   
  ];
  final _answers = const [
    {'text': 'worst', 'score': 1},
    {'text': 'bad', 'score': 2},
    {'text': 'satisfactory', 'score': 3},
    {'text': 'good', 'score': 4},
    {'text': 'excellent', 'score': 5}
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //calls the build method
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      //_questionIndex = 0;
      print('you are done with your quiz!');
    }
    print(_questionIndex);
    print(_totalScore);
    print(text);
    print(_questions.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //return MaterialApp(home: Text('Hello'),);
    print(text);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Colors.blue[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          title: Text('Questionaire'),
        ),
        //body: Text('This is my default text!'),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions:_questions[int.parse(index)]['q'],
                questionIndex: _questionIndex,
                answers: _answers,
              )
            : Result(_totalScore, _resetQuiz,_questions.length,text),
      ),
    );
  }
}
