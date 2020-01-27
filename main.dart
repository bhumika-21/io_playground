//App Description: This app is a GRE Assist. It displays a word along with its meaning. The user has an option to hide or show the meaning of the word
//depending upon his/her choice. The app currently contains a set of ten words with their respective meanings. If the app is commercialized,
//we can link it to a database for bigger data usage.
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRE Assist Flutter Project',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GRE Assist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  var isActive=false;
  int _counter1 = 0;
  int _counter2=1;
  int _counter3=1;
  //var maps={'ant':'insect that crawls','phone':'electronic device'};
  static List wordList=['axiology','atalectasis','befuddle','bibliomania','coy','clamor','dadictic','denigrate','eugenic',
    'ephemeral','gluttony',];
  int wl=wordList.length;

  static List meaningList= ['','theory of moral and aesthetic values','lack of full dilation specially of the lung','to fool someone with wrong actions','a passionate enthusiasm for collecting or possessing books',
    'showing marked and often playful evasiveness or reluctance','proclain something noisily','instructive with a moral intent','belittle someone','causing improvement in the offspring produced',
    'lasting for a short duration','excessive eating or drinking',];
  int ml=meaningList.length;

  /*toList() {
    for (var x in maps.values)
      meaningList.add(x);
  }*/

  void _hideShow() {
    isActive= !isActive;
    if (isActive==true) {
      setState((){
        _counter3=0;
      });
    }
    else {
      setState((){
        _counter3=_counter2;
      });
    }
  }


  void _incrementCounter() {
    setState(() {
      if(_counter3==0) isActive=!isActive;
      if(_counter1==wl-1) {_counter1=0;_counter2=1;}
      else {_counter1++;_counter2++;}
      _counter3=_counter2;
    });
  }

  void _decrementCounter(){
    setState(() {
      if(_counter3==0) isActive=!isActive;
      if(_counter1==0) {_counter1=wl-1;_counter2=ml-1;}
      else {_counter1--; _counter2--;}
      _counter3=_counter2;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WordBox(
              word:wordList[_counter1],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.yellow,
                  child: Text("Previous"),
                  onPressed: _decrementCounter,
                ),
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text("Next"),
                  onPressed: _incrementCounter,
                ),
              ],
            ),
            Text (meaningList[_counter3],style: TextStyle(fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(isActive ? "Show": "Hide"),
        onPressed: _hideShow,
      ),
    );
  }
}


class WordBox extends StatelessWidget {
  var word;

  WordBox({this.word});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$word', style: TextStyle(fontSize: 60,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

