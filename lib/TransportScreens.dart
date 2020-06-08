import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart' as UrlOpen;

class TransportScreenHome extends StatelessWidget {
  final String helpline = "080010000"; // = Firebase.currentHelpline;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        leading: MaterialButton(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Transport Agent Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/transport_agent.png",
                  width: double.maxFinite),
//              Text(
//                "Transport Agents can use the platform\n by speaking to an EssenKiosk Agent",
//                style: TextStyle(
//                    //color: Colors.green,
//                    fontSize: 20,
//                    fontStyle: FontStyle.normal),
//              ),
              Divider(),
              RaisedButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child: Icon(Icons.call)),
                    Text(
                      "     Call EssenKiosk     ",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.green,
                onPressed: () => UrlOpen.launch("tel://$helpline"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.white60,
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              RaisedButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child: Icon(Icons.map)),
                    Text(
                      "  View Harvests Map  ",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: Colors.green,
                onPressed: () => UrlOpen.launch("http://maps.google.com"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.white60,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class TransportProfile {
  String key;
  String transporterID;
  String transporterName;
  String truckLoadCapacityKg;
  String availabiilty; //this is the farmer's phone number
  String centralLocation;
  String img;
  String truckModelName;

  //Set<String> set,    //automated addition. Confirm if there are no problems ******************************
  TransportProfile(
      {this.transporterName,
      this.transporterID, //The ID is the phone number, and is the [key] when pushed to firebase
      this.truckLoadCapacityKg,
      this.availabiilty,
      this.centralLocation,
      this.img,
      this.truckModelName});

/////////////////convert dataset into JSON usable by firebaseCRUD's pushData method
  TransportProfile.fromJson(Map json) {
    this.transporterName = json['transporterName'];
    this.transporterID = json['transporterID'];
    this.truckLoadCapacityKg = json['truckLoadCapacityKg'] ?? '';
    this.availabiilty = json['availabiilty'] ?? '';
    this.centralLocation = json['centralLocation'] ?? '';
    this.img = json['picture'] ?? '';
    this.truckModelName = json['truckModelName'] ?? '';
  }

  //Example format of Set<String> type to be used as input, setStringVariable = {"value1", "value2", "value3"}
  // , where the exact order matters according to the .elementAt() indices below.
  // //all value types are strings.
  TransportProfile.fromString(Set<String> input) {
    this.transporterName = input.elementAt(0);
    this.truckLoadCapacityKg = input.elementAt(1) ?? '';
    this.availabiilty = input.elementAt(2) ?? '';
    this.centralLocation = input.elementAt(3) ?? '';
    this.img = input.elementAt(4) ?? '';
    this.truckModelName = input.elementAt(5) ?? '';
  }

  TransportProfile.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        transporterName = snapshot.value['transporterName'],
        truckLoadCapacityKg = snapshot.value['truckLoadCapacityKg'] ?? '',
        availabiilty = snapshot.value['availabiilty'] ?? '',
        centralLocation = snapshot.value['centralLocation'] ?? '',
        img = snapshot.value['img'] ?? '',
        truckModelName = snapshot.value['truckModelName'] ?? '';

  toJson() {
    return {
      "truckLoadCapacityKg": truckLoadCapacityKg,
      "foodClass": transporterName,
      "centralLocation": centralLocation,
      "farmerID": availabiilty,
      "truckModelName": truckModelName,
      "img": img,
    };
  }
}
