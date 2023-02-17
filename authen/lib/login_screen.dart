import 'package:authen/validation.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // create GlobalKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // create TextEditingController
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //create FocusNode
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isObscure = true;

  final _email = [
    'test',
    'dd@gmail.com',
    '123@gmail.com',
  ];

  final _password = [
    '123456',
    '1234567',
    '12345678',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.lock),
        title: const Text('Authentication App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Icon(
                Icons.food_bank_rounded,
                size: 150,
                color: Colors.amber,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: validatorEmail,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                obscureText: _isObscure,
                validator: validatorPassword,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.key_sharp),
                      SizedBox(height: 8),
                      Text('Login'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      bool correct = false;
      for (var i = 0; i < _email.length; i++) {
        if (_emailController.text == _email[i] &&
            _passwordController.text == _password[i]) {
          correct = true;
          break;
        }
      }
      if (correct) {
        _buildAlertDialog(
                context, correct, 'Login Sucess', 'Welcome to My Application')
            .then(
          (value) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        );
      } else {
        _buildAlertDialog(context, correct, 'Login Fail', 'Please try again');
      }
      _formKey.currentState!.reset();
      _clear();
    } else if (_emailController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_emailFocusNode);
    } else if (_passwordController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_passwordFocusNode);
    }
  }

  void _clear() {
    _emailController.clear();
    _passwordController.clear();
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
  }

  Future<void> _buildAlertDialog(
      BuildContext context, bool correct, String title, String content) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: correct ? Colors.green : Colors.red,
          titleTextStyle: const TextStyle(color: Colors.white),
          contentTextStyle: const TextStyle(color: Colors.white),
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
