import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learneng/Login.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBUOI9lum9pO58CJMz_dxzEo-b5-qk67zQ',
          appId: '1:984615838239:android:2960a438b78a89ee92eb2a',
          messagingSenderId: '984615838239',
          projectId: 'learne-flutter')
    );

    return firebaseApp;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return LoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}
