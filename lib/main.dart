import 'package:flutter/material.dart';
import 'package:testex5/Lesson.dart';
import 'DetailPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(60, 60, 60, 1.0)),
      home: new ListPage(title: 'Lessons'),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(200, 200, 200, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.yellow)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.level,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(60, 60, 60, 1.0)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(60, 60, 60, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_to_home_screen, color: Colors.yellow),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.contact_mail, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_balance, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.group, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Title",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content:
        "Test test test test test test test test test"),
    Lesson(
        title: "Title",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 50,
        content:
        "Test test test test test test test test test"),
    Lesson(
        title: "Title",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Test test test test test test test test test"),
    Lesson(
        title: "Title",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Test test test test test test test test test"),
    Lesson(
        title: "Title",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Test test test test test test test test test"),
    Lesson(
        title: "Title",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Test test test test test test test test test"),
    Lesson(
        title: "Title",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Test test test test test test test test test"),
  ];
}