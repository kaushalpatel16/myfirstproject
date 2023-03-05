import 'package:flutter/material.dart';
import 'package:myfirstproject/customer_details_page.dart';
import 'package:myfirstproject/loginscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool pass = true;
  bool? check2 = true, check3 = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25),
                  child: Container(
                    child: Image.asset("image/dairylogo.jpg",width: 100,alignment: Alignment.center,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome Back!",style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),Text(
                  "   Login to you account",
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter your mobile number!!";
                        }
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your mobile number",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value != null &&
                            value.isEmpty) {
                          return "Enter Password!!";
                        }
                      },
                      obscureText: pass,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (pass) {
                                pass = false;
                              } else {
                                pass = true;
                              }
                            });
                          },
                          icon: Icon(
                            pass == true
                                ? Icons.remove_red_eye
                                : Icons.password,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: CheckboxListTile(
                          title: Text(
                            "Remember me",
                          ),
                          value: check2,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              check2 = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            "Forgot Password?",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.black26,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (builder) => ApiCall(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Login my account",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      "Or Login With",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Color.fromARGB(255, 48, 48, 48),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => ApiCall(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.g_mobiledata_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Google",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Color.fromARGB(255, 48, 48, 48),
                      // rgba(255,212,183,255)
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => ApiCall(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Facebook",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Powerd by Unique IT solutions",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
