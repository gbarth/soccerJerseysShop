import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/auth_exception.dart';
import 'package:shop/models/auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    Auth auth = Provider.of(context, listen: false);

    try {
      if (_isLogin()) {
        //Login
        await auth.login(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        // Registrar
        await auth.signup(
          _authData['email']!,
          _authData['password']!,
        );
      }
    } on AuthException catch (e) {
      _showErrorDialog(e.toString());
    } catch (e) {
      _showErrorDialog('An unexpected error occurred');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        //color: Colors.black,
        padding: const EdgeInsets.all(10),
        height:
            _isLogin() ? deviceSize.height * 0.30 : deviceSize.height * 0.40,
        width: deviceSize.width * 0.75,
        child: FittedBox(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: deviceSize.width * 0.74,
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).colorScheme.onSecondary),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your email',
                      border: InputBorder.none,
                      icon: Icon(Icons.person,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSaved: (email) => _authData['email'] = email ?? '',
                    validator: (_email) {
                      final email = _email ?? '';
                      if (email.trim().isEmpty || !email.contains('@')) {
                        return 'Email must be valid.';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: deviceSize.height * 0.02),
                  width: deviceSize.width * 0.74,
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).colorScheme.onSecondary),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      icon: Icon(Icons.lock,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    controller: _passwordController,
                    onSaved: (password) =>
                        _authData['password'] = password ?? '',
                    validator: (_password) {
                      final password = _password ?? '';
                      if (password.isEmpty || password.length < 5) {
                        return 'Passwords must be at least 5 characters';
                      }
                      return null;
                    },
                  ),
                ),
                if (_isSignup())
                  Container(
                    margin: EdgeInsets.only(top: deviceSize.height * 0.02),
                    width: deviceSize.width * 0.74,
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).colorScheme.onSecondary),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: InputBorder.none,
                        icon: Icon(Icons.lock,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      controller: _passwordController,
                      validator: _isLogin()
                          ? null
                          : (_password) {
                              final password = _password ?? '';
                              if (password != _passwordController.text) {
                                return 'Passwords must be same';
                              }
                              return null;
                            },
                    ),
                  ),
                SizedBox(height: deviceSize.height * 0.02),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  SizedBox(
                    width: deviceSize.width * 0.75,
                    height: deviceSize.height * 0.06,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: Text(
                        _authMode == AuthMode.Login ? 'LOGIN' : 'REGISTER',
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: deviceSize.height * 0.012),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isLogin()
                          ? 'Don\'t have an Account ? '
                          : 'Already have an Account ? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: _switchAuthMode,
                      child: Text(
                        _isLogin() ? 'Sign Up' : 'Sign In',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
