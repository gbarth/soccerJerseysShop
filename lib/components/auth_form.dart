import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Column(
        children: [
          Container(
            width: size.width * 0.74,
            //color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.primary),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obscureText: false,
              cursorColor: const Color.fromARGB(77, 51, 28, 147),
              decoration: const InputDecoration(
                hintText: 'Your Email',
                border: InputBorder.none,
                icon: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            width: size.width * 0.74,
            //color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.primary),
            child: TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              cursorColor: const Color.fromARGB(77, 51, 28, 147),
              decoration: const InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
                icon: Icon(Icons.lock, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
