import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * 0.1,
            child: const Text(
              'SJ Store',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Goldman',
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.16,
            child: Image.asset(
              'assets/images/Ecommerce-checkout.png',
              width: size.width * 0.86,
            ),
          ),
        ],
      ),
    );
  }
}
