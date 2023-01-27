import 'package:app_flowers2/Shared/snackbar.dart';
import 'package:app_flowers2/pages/home.dart';
import 'package:app_flowers2/pages/register.dart';
import 'package:app_flowers2/pages/resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isvisiabilettiy = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  signIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "Wrong password provided for that user.");
      } else {
        showSnackBar(context, "Please try againe");
      }
    }
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.email),
                        hintText: "Enter Your Email : ",
                        // To delete borders
                        enabledBorder: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        // fillColor: Colors.red,
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      )),
                  const SizedBox(height: 33),
                  TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: isvisiabilettiy ? true : false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isvisiabilettiy = !isvisiabilettiy;
                              });
                            },
                            icon: isvisiabilettiy
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        hintText: "Enter Your Password : ",
                        // To delete borders
                        enabledBorder: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        // fillColor: Colors.red,
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      )),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await signIn();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 73, 179, 105)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Sign in",
                            style: TextStyle(fontSize: 19),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do not have account",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                          child: const Text("Sign up",
                              style: TextStyle(fontSize: 20))),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
