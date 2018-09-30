import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
        title: 'Муж на час',
        theme: ThemeData(
          primaryColorLight: Colors.white,
          primaryColorDark: Color.fromARGB(255, 102, 102, 102),
          unselectedWidgetColor: Color.fromARGB(255, 130, 130, 130),
          primaryColor: Color.fromARGB(255, 122, 49, 61),
          accentColor: Color.fromARGB(255, 122, 49, 61), 
          indicatorColor: Color.fromARGB(255, 0, 130, 0),
          highlightColor: Color.fromARGB(102, 255, 198, 54),
          errorColor: Color.fromARGB(140, 200, 0, 0)
        ),
        home: MainPage(),
      );
  }
}
