import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parallax_animation/parallax_animation.dart';

import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA00a_elZDx-5dQ3SCIDLrkGq7s_lw0S28",
          authDomain: "mg-garments-e8325.firebaseapp.com",
          projectId: "mg-garments-e8325",
          storageBucket: "mg-garments-e8325.appspot.com",
          messagingSenderId: "160377336784",
          appId: "1:160377336784:web:a2fd2dc3d54b2800c2bfd5",
          measurementId: "G-WWWRSMNSYC"
      )
  );



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    return
      MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:hmpage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ParallaxArea(
        child: PageView.builder(
          itemCount: 50,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
      return ParallaxWidget(
          child: Center(
            child: Text(
              "PAGE ${index + 1}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

    );
        }
    ))
    );
  }
}
