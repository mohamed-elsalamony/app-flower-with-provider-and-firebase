import 'package:app_flowers2/Shared/snackbar.dart';
import 'package:app_flowers2/pages/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  resetPasword() async {
    isLoading = true;
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERORR:${e.code}");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ResetPassword"),
          backgroundColor: Color.fromARGB(255, 76, 141, 95),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  validator: (value) {
                    return value!.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                        ? null
                        : "Enter a valid email";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
              const SizedBox(height: 20),
              Text(
                "Please Enter Email",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                   
                    if ((_formKey.currentState!.validate())) {
                     resetPasword();
                      // 
                    } else {
                      showSnackBar(context, "ERORR");
                    }
                  },
                  child: isLoading
                      // ignore: prefer_const_constructors
                      ?  CircularProgressIndicator(
                          color: Colors.white,
                        )
                      // ignore: prefer_const_constructors
                      :  Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
