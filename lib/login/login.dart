import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/login/auth_model.dart';
import 'package:flutter_the_movie_database/pages/style/appbar_style.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle.appbar_style,
        body: ListView(
          children: [
            _HeaderWidget(),
          ],
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          FormWidget(),
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
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    final modelButton = context.watch<AuthModel>();
    final onPressed = modelButton.canStartAuth == true
        ? () => modelButton.auth(context)
        : null;
    final child = modelButton.isAuthProgress == true
        ? SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ))
        : Text('Login');
    return Column(
      children: [
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
        ErrorMessageWidget(),
        TextFormField(
          controller: model.loginTextController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Login',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 25,
        ),
        TextFormField(
          controller: model.passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              child: child,
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
      ],
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.watch<AuthModel>().errorMessage;
    if (errorMessage == null) return SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: TextStyle(fontSize: 17, color: Colors.red),
      ),
    );
  }
}
