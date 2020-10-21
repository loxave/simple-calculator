import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}

class  HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 int firstNumber;
 int secondNumber;
 String textToDisplay = "";
 String res;
 String operationToPerform;

  void btnClicked(String btnText){
  if (btnText == "C"){
    textToDisplay= "";
    firstNumber = 0;
    secondNumber = 0;
    res = "";
  } else if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/"){
    firstNumber = int.parse(textToDisplay);
    res =  "";
    operationToPerform= btnText;
  }
  else if(btnText == "=") {
    secondNumber = int.parse(textToDisplay);
    if (operationToPerform== "+") {
      res = (firstNumber + secondNumber).toString();
    }
    if (operationToPerform== "-") {
      res = (firstNumber - secondNumber).toString();
    }
    if (operationToPerform== "x") {
      res = (firstNumber * secondNumber).toString();
    }
    if (operationToPerform== "/") {
      res = (firstNumber ~/ secondNumber).toString();
    }
  } else {
    res = int.parse(textToDisplay+ btnText).toString();
    }

  setState(() {

    textToDisplay= res;
  });
  }
  Widget customButton(String btnval){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,

          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
    "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
          alignment: Alignment.bottomRight,
                  child: Text(
                    "$textToDisplay",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x"),
              ],
            ),
      Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
      )
          ],
        ),
      ),
    );
  }
}
