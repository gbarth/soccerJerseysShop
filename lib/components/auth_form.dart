import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  const AuthForm({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
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
        obscureText: widget.obscureText,
        cursorColor: const Color.fromARGB(77, 51, 28, 147),
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          icon: Icon(widget.icon, color: Colors.white),
        ),
      ),
    );
  }
}
