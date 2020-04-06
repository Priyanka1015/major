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
class TQuestionair extends StatefulWidget {
    final String text;
  TQuestionair({Key key, @required this.text}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState(text);
}

//void main() =>runApp(MyApp());
class _MyAppState extends State<TQuestionair> {
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
    {'topic': 'Interaction', 'q': [
        'Punctuality in the class',
        'Regularity in taking the classes',
        'Rate the activities performed by the lecturer to capture the attention of students?',
        'Rate the lecturer understanding towards students doubts regarding the subject',
        'Completion of course syllabus on time',
        'Organisation of assignments, class tests, quizes and seminars',
        'Coming to class with preparation',
        'check'
      ]},
    {'topic': 'Explore', 'q': [
      'How well are you satisfied with the lecturer conducting classroom discussions for the students to explore topics on their own?',
      'How are you satisfied with the lecturer able to sustain students interest in exploring the subject to be taught?',
      'Rate how well does the lecturer ensure that all the students are involved in the discussions?',
      'How well does the lecturer motivate students to demonstrate on what they understood from the subject taught?',
      'Rate the planning of the lecturer to teach te concepts',
      'Rate the level of creativity in teaching the subject',
      'How do you rate the lecturer\'s experience on the subject',
      'check'
    ]},
    {'topic': 'Explanation', 'q': [
      'Rate the lecturer\'s knowledge on the subject',
      'Rate the lecturer\'s to give clear and understandable presentations',
      'Rate how well the lecturer is able to pass the knowledge on th subject the the students',
      'How are you satisfied with the lecturer\'s explaining subject matter to students',
      'Rate the lecturer\'s Skill of linking subject to life experience & creating interest in the subject',
      'Rate the lcturer\'s work towards referring to latest developlment in the subject',
      'Rate the lecturer response to students doubt clarifications',
      'check'
    ]},
    {'topic': 'Elaborate', 'q': [
      'How well are you satisfied with the lecturer helping students to memorize the topics previously taught?',
      'Rate the lecturer\'s delivery of structured lecture',
      'Rate how well does the lecturer focus on the subject concepts?',
      'Rate how well are you satisfied with the innovative teaching methods of the faculty',
      'Rate how well does the lecturer help students who are lagging behind the concepts track',
      'Rate the lecturer motive to explain concepts with real life experiences',
      'Rate how well does the lecturer capture students involvement in class tasks',
      'check'
    ]},
    {'topic': 'Evaluate', 'q': [
      'Rate the teacher\'s use of assessments for learning',
      'Rate the teacher\'s day to day analysis on students progress',
      'Rate frequency of the teacher\'s evaluation on assignments and quizes',
      'Rate teacher\'s approach towards developing professional skills among students',
      'Rate the internal assessment evaluation bu the lecturer',
      'Rate the lecturer\'s effective use of instructional time',
      'Rate on the lectuter\'s plan and implementation of class procedurs that support students learning',
      'check'

    ]},
    {'topic': 'Class Control', 'q': [
      'Rate the Control mechanism in effectively conducting the class',
      'Rate the Skills of addressing inappropriate behaviour of student',
      'Rate the Tendency of inviting opinion and question on subject matter from students',
      'Rate the enhancement in learning by judicious reinforcement mechanism',
      'Rate the lecturer control over the class',
      'Rate the lecturer\'s approach to create a positive environment among students',
      'Rate lecturer ablility to evaluate student response in time',
      'check'
    ]},
    {'topic': 'General Teacher attitude', 'q': [
      'Rate the teacher\'s attitude towards students',
      'How well are you satisfied with the teacher\'s attempt to bring equality among students in th class',
      'How well are you satisfied with the teacher\'s attempt to provide special attention towards slow learners',
      'Rate the enhancement in learning by judicious reinforcement mechanism',
      'Rate if the lecturer provides feedback to students for their improvement',
      'Rate the lecturer confidence on the subject concepts',
      'Rate the lecturer hands-on activities to teach the subject',
      'check'
    ]}
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
    //print(text);
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
