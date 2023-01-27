

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  State<ProfileHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileHome> {
  final Credential = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text("Profile Page"),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(
                "LogOut",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Center(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Container(
                alignment:Alignment.center ,
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(130, 167, 231, 1),
                  borderRadius: BorderRadius.circular(25)
                   ),
                   child:  Text("Data Form Authacition",style:TextStyle(fontSize: 25),textAlign: TextAlign.center,),
               ),
             ),
           )
         
         , SizedBox(
          height: 15,
         ),
         
         Column(
         
          children: [
            const Text("Email :",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ,SizedBox(height: 15,), 
            const Text("Password :",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ,SizedBox(height: 15,),  
            const Text("Date :",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ,SizedBox(height: 15,),   
          ],
          )
         ,SizedBox(height: 30,),
          Center(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Container(
                alignment:Alignment.center ,
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(130, 167, 231, 1),
                  borderRadius: BorderRadius.circular(25)
                   ),
                   child:  Text("Data Form FireStore",style:TextStyle(fontSize: 25),textAlign: TextAlign.center,),
               ),
             ),
           )
         
         
          ],
        ),
      ),
  );
  }
}
