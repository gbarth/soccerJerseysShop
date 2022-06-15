import 'package:flutter/material.dart';
import 'package:shop/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.08,
                    ),
                    child: const Text(
                      'SJ Store',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        fontFamily: 'Goldman',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.15,
                    ),
                    child: Image.asset(
                      'assets/images/Ecommerce-checkout.png',
                      width: size.width * 0.82,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.07,
                    ),
                    child: const AuthForm(
                      hintText: ' Your Email',
                      icon: Icons.person,
                      obscureText: false,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 14,
                    ),
                    child: AuthForm(
                      hintText: ' Password',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
