import 'package:essenkiosk1/AgentScreens.dart';
import 'package:essenkiosk1/BuyerScreens.dart';
import 'package:essenkiosk1/TransportScreens.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart' as LaunchUrl;

final dBRoot = FirebaseDatabase.instance.reference();
//Firebase config
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    //Force no auto-rotate. Depends on flutter:services import.
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    String _transportHowto =
        "Tap the icon above to enter the Transport Portal.\n\nTransport agents can use the service by ";
    String _agentHowto = "Click the icon above to enter the Agent Portal.";
    String _buyerHowto =
        "Tap the icon above to enter the Buyer Portal. \n\nBuyers can use the platform by entering required product details and picking from the provided search results.\n\nTap the Call Button below to speak to an EssenKiosk agent. ";
    final _mainScreenPages = <Widget>[
      Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: () {
              LaunchUrl.launch("tel://080010000");
            },
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              InkWell(
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(40),
                    child: Image(
                      image: AssetImage("assets/images/buyer_avatar.png"),
                      height: 100,
                    )),
                highlightColor: Colors.yellow,
                onTap: () {
                  Navigator.push(
                    this.context,
                    MaterialPageRoute(builder: (context) => BuyerScreenHome()),
                  );
                },
              ),
              SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        _buyerHowto,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Georgia",
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  )),
            ],
          )),
      Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.call,
            color: Colors.white,
          ),
          onPressed: () {
            LaunchUrl.launch("tel://080010000");
          },
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          InkWell(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
              child: Image(
                image: AssetImage("assets/images/transport_agent.png"),
                height: 100,
              ),
            ),
            highlightColor: Colors.yellow,
            onTap: () {
              Navigator.push(
                this.context,
                MaterialPageRoute(builder: (context) => TransportScreenHome()),
              );
            },
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              _transportHowto,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Georgia",
                  fontStyle: FontStyle.italic),
            ),
          )
        ]),
      ),
      Center(
        child: Column(
          children: <Widget>[
            InkWell(
              canRequestFocus: true,
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                  child: Image(
                    image: AssetImage("assets/images/call_agent.png"),
                    height: 100,
                  )),
              highlightColor: Colors.yellow,
              onTap: () {
                Navigator.push(
                  this.context,
                  MaterialPageRoute(builder: (context) => AgentScreenLogin()),
                );
              },
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _agentHowto,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Georgia",
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      )
    ];
    return MaterialApp(
      title: 'Select Service',
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 35),
          backgroundColor: Colors.lightGreen,
          unselectedItemColor: Colors.white,
          currentIndex: curIndex,
          onTap: (currentIndex) {
            setState(() {
              this.curIndex = currentIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text(
                  'Buyer',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus),
                title: Text(
                  'Transporter',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_phone),
                title: Text(
                  'Agent',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Select Service'),
        ),
        body: _mainScreenPages[curIndex],
      ),
    );
  }
}
