import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maiden/database.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;

  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    // Store to database and return an id
    savePost(post);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello World!')),
        body: Column(children: <Widget>[
          // Expanded makes sure everything we have as a child, covers entire area/area
          Expanded(child: PostList(this.posts, widget.user)),
          TextInputWidget(this.newPost)
        ]));
  }
}
