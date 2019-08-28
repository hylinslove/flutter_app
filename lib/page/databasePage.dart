import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabasePage extends StatefulWidget {
  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var classController = TextEditingController();

  Database _db;

  List<Map<String,dynamic>> _list = [];

  @override
  void initState() {
    initDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据库"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("姓名",textAlign: TextAlign.center,),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: nameController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("年龄",textAlign: TextAlign.center,),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: ageController,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("性别",textAlign: TextAlign.center,),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: genderController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("班级",textAlign: TextAlign.center,),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: classController,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: FlatButton(
                      onPressed: (){
                        createDb();
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("创建"),
                    ),
                  ),

                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: FlatButton(
                      onPressed: (){
                        insert();
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("新增"),
                    ),
                  ),

                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: FlatButton(
                      onPressed: (){
                        query();
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("查询"),
                    ),
                  ),

                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: FlatButton(
                      onPressed: (){
                        update();
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("修改"),
                    ),
                  ),

                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: FlatButton(
                      onPressed: (){
                        delete();
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("删除"),
                    ),
                  ),

                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context,index) {
                  return Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text("${_list[index]["id"]}"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(_list[index]["name"]),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(_list[index]["age"]),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(_list[index]["gender"]),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(_list[index]["class"]),
                        ),
                      ],
                    ),
                  );
                } ,
              ),
            )
          ],
        ),
      ),
    );
  }

  void initDb() async {
//    _db = await openDatabase("demo.db");
//    if(_db == null) {
//      print("db = null");
//    } else {
//      print("db != null");
//    }

  }
  void createDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db,int version)async {
        await db.execute("CREATE TABLE IF NOT EXISTS student("
            "id integer primary key,name text, age text, gender text, class text)");
      }
    );

    if(_db == null) {
      print("db = null");
    } else {
      print("db != null");
    }
  }

  void insert() async {
    await _db.transaction((txn) async {
      int id = await txn.rawInsert(
        "INSERT INTO student(name,age,gender,class) VALUES (?,?,?,?)",
        [nameController.text,ageController.text,genderController.text,classController.text]
      );
      print("insert : $id");
    });
  }

  void update() async {
    int id = await _db.rawUpdate(
      "UPDATE student SET age = ?, gender = ?,class = ? WHERE name = ?",
      [ageController.text,genderController.text,classController.text,nameController.text]
    );
    print("update : $id");
  }
  
  void query() async {
    List<Map<String ,dynamic>> list =  await _db.rawQuery("SELECT * FROM student");
    setState(() {
      _list = list;
    });

  }
  
  void delete() async {
    int id = await _db.rawDelete('''DELETE FROM student WHERE name = "${nameController.text}"''');
    print("delete : $id");
  }
}
