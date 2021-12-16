import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/pages/style/appbar_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle.appbar_style,
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login to your account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black54),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                initialValue: 'admin',
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Login',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                initialValue: 'admin',
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/main_page');
                    },
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(20, 12, 20, 12)),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reset password',
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' If you do not have an account, '
                    'registering for an account is free and simple.',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Registration',
                        style: TextStyle(fontSize: 16),
                      )),
                  Text(
                    "If you signed up but didn't get your verification email, click here to have it resent.",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Verivication email',
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
