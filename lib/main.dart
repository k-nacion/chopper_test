import 'package:chopper_test/data/post_api_service.dart';
import 'package:chopper_test/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';

void main() => runApp(ChopperMain());

class ChopperMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PostApiService>(
      create: (context) => PostApiService.create(),
      dispose: (context, value) => value.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chopper Playground',
        theme: generateAppTheme(context),
        routes: {'/': (_) => Homepage()},
      ),
    );
  }
}
