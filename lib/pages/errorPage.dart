import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.message,
    required this.buttonMessage,
    required this.retryMessage,
    required this.onPressed,
    required this.email,
    required this.retry,
  });

  final String message;
  final String email;
  final String buttonMessage;
  final String retryMessage;
  final VoidCallback? onPressed;
  final VoidCallback? retry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  height: 130,
                  width: 130,
                  child: Image(
                    image: AssetImage('Assets/icons/error.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 247, 1, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                'Email sent to the email : $email',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        onPressed!();
                      },
                      child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            buttonMessage,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '|',
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        retry!();
                      },
                      child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.cyan)),
                        child: Center(
                          child: Text(
                            retryMessage,
                            style: const TextStyle(
                              color: Colors.cyan,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
