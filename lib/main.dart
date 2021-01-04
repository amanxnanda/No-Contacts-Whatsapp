import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_encoder/url_encoder.dart';
import 'package:url_launcher/url_launcher.dart';

const apiURL = 'https://api.whatsapp.com/send?phone=91';
String message;
String requestURL;
String number;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrontPage(),
    );
  }
}

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "No Contacts Whatsapp",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 100,

              //color: Colors.white,
              child: TextField(
                onChanged: (value) {
                  number = value;
                },
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 20.0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gapPadding: 10.0),
                  counterText: "",
                  labelText: "Phone Number",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: 5.0,
                  ),
                  prefixIcon: Icon(Icons.phone),
                  // hintText: "Enter valid email id...",
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  // ),
                ),
              ),
              decoration: BoxDecoration(
                //color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 100,

              //color: Colors.white,
              child: TextField(
                onChanged: (value) {
                  message = value;
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 20.0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gapPadding: 10.0),
                  counterText: "",
                  labelText: "Message",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: 5.0,
                  ),
                  prefixIcon: Icon(Icons.mail),
                  // hintText: "Enter valid email id...",
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  // ),
                ),
              ),
              decoration: BoxDecoration(
                //color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          FlatButton(
            child: Text(
              'Say Hi!',
              style: TextStyle(color: Colors.white),
            ),
            color: Color.fromARGB(230, 18, 140, 126),
            //clipBehavior: ,
            splashColor: Colors.redAccent,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            shape: StadiumBorder(side: BorderSide.none),

            onPressed: () {
              setState(() {
                _launchUrl('Hi');
              });
            },
          ),

          FlatButton(
            child: Text(
              'Send your message',
              style: TextStyle(color: Colors.white),
            ),
            color: Color.fromARGB(230, 18, 140, 126),
            //clipBehavior: ,
            splashColor: Colors.redAccent,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            shape: StadiumBorder(side: BorderSide.none),

             onPressed: () {
              setState(() {
                _launchUrl(message);
              });
            },
          )
        ],
      ),
    );
  }
}

_launchUrl(String messageFromButton) async {
  String url = '$apiURL$number&text=${urlEncode(text: messageFromButton)}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'could not launch $url';
  }
}
