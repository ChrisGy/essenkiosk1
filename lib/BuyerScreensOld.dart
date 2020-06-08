import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      child: Container(
          height: 350.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color(0xFF01579B),
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new SizedBox(
                height: 20.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      child: new Container(
                        height: 80.0,
                        width: 100.0,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.directions_car,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            new SizedBox(height: 10.0),
                            new Text(
                              'Emergency',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0XFF82B1FF),
                        ),
                      ),
                      onTap: () => print("hello")),
                  GestureDetector(
                      child: new Container(
                        height: 80.0,
                        width: 100.0,
                        child: Center(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                Icons.person,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              new SizedBox(height: 5.0),
                              new Text(
                                'Security issue',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.red,
                        ),
                      ),
                      onTap: () => print("hello")),
                  GestureDetector(
                      child: new Container(
                        height: 80.0,
                        width: 100.0,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.local_car_wash,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            new SizedBox(height: 10.0),
                            new Text(
                              'Emergency',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0XFFBF360C),
                        ),
                      ),
                      onTap: () => print("hello")),
                ],
              ),
              new SizedBox(height: 13.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 5.0, 10.0, 5.0),
                child: new Text(
                  "Ride sharing :",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  textDirection: TextDirection.ltr,
                ),
              ),
              new SizedBox(height: 13.0),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      child: new Container(
                          height: 80.0,
                          width: 100.0,
                          child: Center(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text("Report",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                                new SizedBox(height: 5.0),
                                new Text("Report incidence",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                          )),
                      onTap: () => print("hello")),
                  GestureDetector(
                    child: new Container(
                        height: 80.0,
                        width: 100.0,
                        child: Center(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text("Announce",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              new SizedBox(height: 5.0),
                              new Text("Announcement",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0XFF8BC34A),
                        )),
                    onTap: () => print("hello"),
                  ),
                  GestureDetector(
                      child: new Container(
                          height: 80.0,
                          width: 100.0,
                          child: Center(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "Security tips ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                                new SizedBox(height: 5.0),
                                new Text("Tips",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Color(0XFF1A237E),
                          )),
                      onTap: () => print("hello")),
                ],
              )
            ],
          )),
    );
  }
}
