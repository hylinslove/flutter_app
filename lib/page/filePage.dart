import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FilePage extends StatefulWidget {
  @override
  _FilePageState createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {

  @override
  void initState() {

    getPath();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("文件读写"),
      ),
      body: Container(

      ),
    );
  }

  void getPath() async {
    //临时存储目录
    Directory tempDic = await getTemporaryDirectory();
    print("临时存储目录"+tempDic.path);

    //FILE存储目录
    Directory fileDic = await getApplicationDocumentsDirectory();
    print("FILE存储目录"+fileDic.path);

    //外部存储目录
    Directory externalPath = await getExternalStorageDirectory();
    print("外部存储目录"+externalPath.path);


  }
}
