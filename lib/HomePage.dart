import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './title.dart';
import './drawer.dart';
import './body.dart';
class HomeUIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      title(size, 'Home Page'),
                      Row(
                        children: <Widget>[
                          drawerbox(size),
                          Body(),
                        ],
                      )
                    ]))));
  }
}
