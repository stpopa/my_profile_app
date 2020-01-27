import 'package:endava_profile_app/modules/login/components/form/login_form_body.dart';
import 'package:endava_profile_app/themes/main_theme.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
                height: 443,
                width: 323,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login-background.png"),
                    fit: BoxFit.none,
                  ),
                )),
            SafeArea(
              child: MainTheme(
                child: Builder(
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(left: 32, top: 70, right: 32),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('endava',
                                  style: Theme.of(context).textTheme.subtitle),
                              Text('PROFILE',
                                  style: Theme.of(context).textTheme.title),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              LoginForm(
                                onMailChanged: (value) {
                                  email = value;
                                },
                                onPasswordChanged: (value) {
                                  password = value;
                                },
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(),
                              ),
                              Center(
                                child: MaterialButton(
                                    padding:
                                        EdgeInsets.only(left: 58, right: 58),
                                    height: 48,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Text(
                                      'Continue',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    color: Theme.of(context).buttonColor,
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        print(email);
                                        print(password);
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                content: Center(
                                                  child: Text(
                                                    'Processing',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .button,
                                                  ),
                                                )));
                                      }
                                    }),
                              ),
                              SizedBox(
                                height: 48,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
