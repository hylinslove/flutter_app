import 'package:flutter/material.dart';
import 'package:flutter_app/entity/widgetBean.dart';

class WidgetPage extends StatefulWidget {
  @override
  WidgetPageState createState() => WidgetPageState();
}

class WidgetPageState extends State<WidgetPage> {
  List<WidgetBean> widgets;

  @override
  Widget build(BuildContext context) {
    initWidgets();

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text("Widget"),
      ),
      /**
       * long list
       */
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print("item clicked");
            },
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widgets[index].name}",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "${widgets[index].description}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void initWidgets() {
    widgets = new List();
    widgets.add(WidgetBean(
        name: "TextView", description: "文本控件", icon: Icons.text_fields));
  }
}
