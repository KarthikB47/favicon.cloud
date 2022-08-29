import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    });

    return Scaffold(
      body: Container(
        color: Colors.red[400],
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/faviconLogo.png',
                width: 150,
                height: 150,
              ),
              const Text(
                'Favicon.cloud',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.pink[50],
        child: Column(
          children: [
            titleSection,
            UploadBtn,
          ],
        ),
      ),
      floatingActionButton: ShareBtn,
      bottomNavigationBar: bottomNavBar,
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Free Favicon Hosting',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            const Text(
              'Upload may take upto 30 seconds, depending on load',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ))
      ],
    ),
  );

  Widget UploadBtn = Container(
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: const Text(
                  'Upload your logo',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    ),
  );

  Widget ShareBtn = SpeedDial(
    icon: Icons.share,
    // animatedIcon: AnimatedIcons.menu_close,
    backgroundColor: Colors.pink,
    children: [
      SpeedDialChild(
        child: Icon(Icons.mail),
        label: 'Mail',
      ),
      SpeedDialChild(
        child: Icon(Icons.copy),
        label: 'Copy',
      ),
      SpeedDialChild(
        child: Icon(FontAwesomeIcons.facebook),
      ),
      SpeedDialChild(
        child: Icon(FontAwesomeIcons.twitter),
      ),
      SpeedDialChild(
        child: Icon(FontAwesomeIcons.whatsapp),
      ),
      SpeedDialChild(
        child: Icon(FontAwesomeIcons.instagram),
      ),
    ],
  );

  Widget bottomNavBar =
      BottomNavigationBar(backgroundColor: Colors.pink[400], items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.pink,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.upload),
      label: 'Upload',
      backgroundColor: Colors.pink,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'chat',
      backgroundColor: Colors.pink,
    ),
  ]);
}
