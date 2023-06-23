import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _errorMessage = '';
  TextEditingController emailController = TextEditingController();
  static const List<Color> _kDefaultRainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

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

  Future<void> resetPassword() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: SizedBox(
            height: 90,
            width: 90,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScalePulseOutRapid,
              colors: _kDefaultRainbowColors,
              strokeWidth: 4.0,
              pathBackgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  const Text(
                    'Link Sent to ',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    emailController.text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.green),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.done_outlined,
                        color: Colors.green,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    } catch (error) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Text(
                    'Error : $error',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Icon(
                      Icons.error_outline_sharp,
                      color: Colors.red,
                      size: 32,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const SizedBox(
                      height: 23,
                      width: 23,
                      child: Image(image: AssetImage('Assets/icons/close.png')),
                    ),
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                    width: 23,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 170,
              width: 170,
              child: Image(
                image: AssetImage('Assets/icons/AppsAiT.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Enter your Email',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
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
            ),
            if (_errorMessage == '')
              Container(height: 11)
            else
              Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  _errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            InkWell(
              onTap: resetPassword,
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
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
