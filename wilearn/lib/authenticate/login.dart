import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wilearn/assets/assets.dart';
import 'package:wilearn/authenticate/register.dart';
import 'package:wilearn/pages/homepage.dart';

import '../assets/routes.dart';
import '../assets/wi_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  String enteredEmail = '';
  String enteredPassword = '';
  bool emailIsCorrect = false;
  bool passwordIsCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            margin: const EdgeInsets.all(35.0),
            constraints: const BoxConstraints(
              maxWidth: 650.0,
            ),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                    Image.asset(
                        ImageAssets.logo_trans,
                        scale: 1.7,
                    ),
                    const Text("Wilearn", style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 40.0,
                      color: Colors.indigo,
                    ),),
                 ],
               ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                  child: Column(
                    children: [
                      const Text("Log into account",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        decoration: buildTextFieldDecoration(label: "Enter Email or Username",),

                        onChanged: (value){
                          setState(() => enteredEmail = value);
                        },

                        validator: (value) {
                          final regExp = RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
                          if (value!.isEmpty) {
                            return "Please enter an Email or Username";
                          } else {
                            return null;
                          }
                        },

                        onSaved: (value){
                          if(value == "user@elearn.com" || value == 'mlespa'){
                            setState(() {
                              emailIsCorrect = true;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 25.0,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: buildTextFieldDecoration(label: "Enter Password",),
                        obscureText: true,
                        onChanged: (value){
                          setState(() => enteredPassword = value);
                        },

                        validator: (value){
                          if (value!.isEmpty){
                            return "Please enter your password";
                          } else {
                            return null;
                          }
                        },

                        onSaved: (value){
                          if(value == "learn1234"){
                            setState(() {
                              passwordIsCorrect = true;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 20.0,),

                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: TextButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                                ),
                                child: const Text("Forgotten Password?", textAlign: TextAlign.center,),
                            ),
                          ),

                          const SizedBox(width: 10.0,),

                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    _formKey.currentState!.save();
                                    SnackBar snackBar;
                                    if(emailIsCorrect && passwordIsCorrect){
                                      snackBar = SnackBar(content: Text("You are Logged In\n$enteredEmail\n$enteredPassword"));
                                      context.goNamed(RouteNames.dashboard);
                                    } else {
                                      snackBar = SnackBar(content: Text("Wrong Credentials\n$enteredEmail\n$enteredPassword"));
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 0, vertical: 20)),
                                ),
                                child: const Text("Log In"),
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      context.goNamed(RouteNames.signup);
                    },
                    child: const Text("Don't have an account"),
                  ),
                  OutlinedButton(
                    onPressed: (){
                      context.goNamed(RouteNames.signup);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                    ),
                    child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      )
    );
  }
}
