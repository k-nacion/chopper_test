import 'package:chopper_test/screens/homepage.dart';
import 'package:flutter/material.dart';

import 'config/theme.dart';

void main() => runApp(ChopperMain());

class ChopperMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chopper Playground',
      theme: generateAppTheme(context),
      routes: {'/': (_) => Homepage()},
    );
  }
}
