import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:chopper_test/data/post_api_service.dart';
import 'package:chopper_test/widgets/post.dart' as widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/post.dart' as model;

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Theme.of(context).primaryColor));

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                'Feeds',
                style: TextStyle(fontSize: 32, color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: FutureBuilder<Response>(
                  future: Provider.of<PostApiService>(context).getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final List posts = json.decode(snapshot.data!.bodyString);
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final int userId = posts[index]['userId'];
                          final int id = posts[index]['id'];
                          final String title = posts[index]['title'];
                          final String body = posts[index]['body'];

                          final model.Post postObject =
                              model.Post(userId: userId, id: id, title: title, body: body);

                          return widget.Post(post: postObject);
                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 42,
                          indent: 45,
                          endIndent: 45,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        itemCount: posts.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 32),
                      );
                    }

                    return Container(
                      height: 250,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
