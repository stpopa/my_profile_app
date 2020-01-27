import 'package:endava_profile_app/themes/contributors_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ContributorsTheme(
          child: Stack(
            children: <Widget>[
              _getCircleImage(),
              _getContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCircleImage() {
    final circleHeight = screenHeight * 0.6;
    return Container(
      width: 323,
      height: circleHeight,
      decoration: BoxDecoration(
          color: Color(0xfff6f6f6),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(circleHeight / 2),
            bottomRight: Radius.circular(circleHeight / 2),
          )),
    );
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(31, 70, 31, 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getHeader(),
              _getInputWidgets(),
              SizedBox(height: 50),
              _getSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("endava".toLowerCase(),
            style: TextStyle(
              fontSize: 17,
              letterSpacing: -0.5,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        Text("profile".toUpperCase(),
            style: TextStyle(
              fontSize: 40,
              letterSpacing: -2.5,
              color: Color(0xffde411b),
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }

  Widget _getInputWidgets() {
    final hintStyle = TextStyle(
        color: Color(0xffb2b2b2), fontSize: 15, fontWeight: FontWeight.bold);
    final textStyle = TextStyle(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);
    final underlinedBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffb2b2b2)));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          style: textStyle,
          decoration: InputDecoration(
            hintText: "Email address",
            hintStyle: hintStyle,
            enabledBorder: underlinedBorder,
            focusedBorder: underlinedBorder,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: TextField(
            obscureText: true,
            style: textStyle,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: hintStyle,
              enabledBorder: underlinedBorder,
              focusedBorder: underlinedBorder,
            ),
          ),
        )
      ],
    );
  }

  Widget _getSubmitButton() {
    return Center(
      child: Container(
        height: 48,
        width: 195,
        child: RaisedButton(
          child: Text(
            "Continue",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {},
          color: Color(0xffde411b),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(48.0),
            side: BorderSide(color: Color(0xffde411b)),
          ),
        ),
      ),
    );
  }
}
