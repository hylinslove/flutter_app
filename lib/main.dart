import 'package:flutter/material.dart';
import 'package:flutter_app/page/WidgetPage.dart';
import 'package:flutter_app/page/filePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          primaryColorLight: Colors.lightBlue,
          accentColor: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.blue,
            size: 26,
          )),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WidgetPage()));
              },
              leading: Icon(
                Icons.widgets,
                color: Colors.blue,
              ),
              title: Text("控件"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WidgetPage()));
              },
              leading: Icon(
                Icons.airplay,
                color: Colors.blue,
              ),
              title: Text("布局"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WidgetPage()));
              },
              leading: Icon(
                Icons.perm_data_setting,
                color: Colors.blue,
              ),
              title: Text("数据库"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FilePage()));
              },
              leading: Icon(
                Icons.insert_drive_file,
                color: Colors.blue,
              ),
              title: Text("文件读写"),
            ),
          ],
        ));
  }
}
