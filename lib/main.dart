import 'package:app_flowers2/Shared/snackbar.dart';
import 'package:app_flowers2/pages/ProfilePage.dart';
import 'package:app_flowers2/pages/details.dart';
import 'package:app_flowers2/pages/home.dart';
import 'package:app_flowers2/pages/resetPassword.dart';
import 'package:app_flowers2/pages/signIn.dart';
import 'package:app_flowers2/pages/register.dart';
import 'package:app_flowers2/prvider/Card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



 Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child:   
       MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_co5nst_constructors
         home: 
         StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {return const Center(child: CircularProgressIndicator(color: Colors.white,));} 
      else if (snapshot.hasError) {return showSnackBar(context, "Something went wrong");}
      else if (snapshot.hasData) {return  const Home();}
      else { return Login();}
    },
 ),
      ),
    );
  }
}
