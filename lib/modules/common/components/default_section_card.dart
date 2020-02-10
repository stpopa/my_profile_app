import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultSectionCard extends StatelessWidget {
  final String title;
  final String imageName;
  final VoidCallback onPressed;

  DefaultSectionCard(
    this.title,
    this.imageName,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 48, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/images/$imageName", width: 48, height: 48),
              SizedBox(height: 8),
              Text(title,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("ADD NOW",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 16,
                      )),
                  Image.asset('assets/images/arrowNext.png',
                      alignment: Alignment.centerRight, width: 22, height: 16)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
