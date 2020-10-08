import 'package:endava_profile_app/common/components/button.dart';
import 'package:endava_profile_app/common/components/text_input.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/login/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endava_profile_app/common/constants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        print(state);

        if (state is LoginFailure) {
          _showLoginFailure(context);
        } else if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
              strokeWidth: 6,
            ),
          );
        }

        if (state is LoginSuccess)
          Future.delayed(Duration(milliseconds: 10), (){
            Navigator.of(context)
                .pushReplacementNamed(AppRoute.of(AppScreen.home));
          });

        return Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextInput(
                    initialValue: "cc@gmail.com",
                    hintText: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    autovalidate: true,
                    validator: (_) =>
                        state.isEmailValid ? null : 'Invalid email',
                  ),
                  SizedBox(height: Dimens.spacingLarge),
                  TextInput(
                    initialValue: "111222333",
                    hintText: 'Password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    autovalidate: true,
                    validator: (_) =>
                        state.isPasswordValid ? null : 'Invalid password',
                  ),
                ],
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Button(
                  label: 'Continue',
                  onPressed: _onContinuePressed,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    _loginBloc.add(
      FormSubmitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void _showLoginFailure(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect login or password'),
          backgroundColor: Theme.of(context).accentColor,
        ),
      );
    });
  }
}
