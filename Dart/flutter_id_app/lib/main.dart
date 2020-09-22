import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ShadowCard(),
  ));
}

class ShadowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title:Text('Shadow Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        // remove drop shadow
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: CircleAvatar(
                backgroundImage: AssetImage('assets/3.jpg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 80,
              color: Colors.grey[800],
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2
              ),
            ),
            // trick to creating space between widgets
            SizedBox(height: 10),
            Text(
              'Martin Mwiti',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Current Shadow Level',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2
              ),
            ),
            // trick to creating space between widgets
            SizedBox(height: 10),
            Text(
              '8',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10),
                Text(
                  "martinmwiti@test.com",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    letterSpacing: 1
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}