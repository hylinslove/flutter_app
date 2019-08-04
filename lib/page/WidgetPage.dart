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
      appBar: AppBar(
        title: Text("Widget"),
      ),
      /**
       * long list
       */
      body: ListView.builder(
        padding: EdgeInsets.all(2),
        itemCount: widgets.length,
        itemBuilder: (context,index) {
          return Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(3))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widgets[index].name}",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blueAccent,
                    fontWeight:FontWeight.w400,
                  ),
                ),
                Text(
                  "${widgets[index].description}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void initWidgets() {
    widgets = new List();
    widgets.add(WidgetBean(
      name: "TextView",
      description: "文本控件",
      icon: Icons.text_fields
    ));
    widgets.add(WidgetBean(
        name: "TextView",
        description: "文本控件",
        icon: Icons.text_fields
    ));
    widgets.add(WidgetBean(
        name: "TextView",
        description: "文本控件",
        icon: Icons.text_fields
    ));
    widgets.add(WidgetBean(
        name: "TextView",
        description: "文本控件",
        icon: Icons.text_fields
    ));
    widgets.add(WidgetBean(
        name: "TextView",
        description: "文本控件",
        icon: Icons.text_fields
    ));

  }
}
