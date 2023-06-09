import 'package:drums_pad/services/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
    required this.pageKey,
  });
  int pageKey;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String _errorMessage = '';

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "* Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "* Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = '';
      });
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        _errorMessage = error.message!;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        _errorMessage = error.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: SizedBox(
                      height: 23,
                      width: 23,
                      child: Image(image: AssetImage('Assets/icons/close.png')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => setState(() {
                              widget.pageKey = 1;
                            }),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: widget.pageKey == 1
                                    ? Colors.cyan
                                    : Colors.white,
                                fontSize: 21,
                                fontWeight: widget.pageKey == 1
                                    ? FontWeight.w800
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          '|',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => setState(() {
                              widget.pageKey = 2;
                            }),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: widget.pageKey == 2
                                    ? Colors.cyan
                                    : Colors.white,
                                fontSize: 21,
                                fontWeight: widget.pageKey == 2
                                    ? FontWeight.w800
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              if (widget.pageKey == 1)
                Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: AssetImage('Assets/icons/AppsAiT.png'),
                      ),
                    ),
                    const Text(
                      'Welcome to AppsAiT',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {
                            validateEmail(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintText: 'example@gmail.com',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: passwordController,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                _errorMessage = "* Password can not be empty";
                              });
                            } else {
                              setState(() {
                                _errorMessage = "";
                              });
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintText: 'password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    InkWell(
                      onTap: signInWithEmailAndPassword,
                      // onTap: () async {
                      //   User? user = await loginUsingEmailPassword(
                      //       email: emailController.text,
                      //       password: passwordController.text,
                      //       context: context);
                      //   print('================> $user');
                      // },
                      child: Container(
                        width: 180,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 7, 116, 130),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: const Color.fromARGB(255, 76, 83, 85),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 187, 193, 195)),
                          ),
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: const Color.fromARGB(255, 76, 83, 85),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 30),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 44, 49, 50),
                          border: Border.all(color: Colors.cyan, width: 1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage('Assets/icons/google.png'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Login with Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              else if (widget.pageKey == 2)
                Column(
                  children: [
                    const SizedBox(
                      height: 180,
                      width: 180,
                      child: Image(
                        image: AssetImage('Assets/icons/AppsAiT.png'),
                      ),
                    ),
                    const Text(
                      'Welcome to AppsAiT',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Full Name',
                            labelText: 'Full Name',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {
                            validateEmail(value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintText: 'example@gmail.com',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Phone Number',
                            labelText: 'Phone Number',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 44, 49, 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: 180,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 7, 116, 130),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: const Color.fromARGB(255, 76, 83, 85),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 187, 193, 195)),
                          ),
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: const Color.fromARGB(255, 76, 83, 85),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 30),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 44, 49, 50),
                          border: Border.all(color: Colors.cyan, width: 1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage('Assets/icons/google.png'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Login with Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
