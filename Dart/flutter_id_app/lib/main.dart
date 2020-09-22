import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ShadowCard(),
  ));
}

// class 'ShadowCard' extends StatefulWidget
class ShadowCard extends StatefulWidget {
  @override
  // createState() is returning an instance of State<ShadowCard> object
  _ShadowCardState createState() => _ShadowCardState();
}

class _ShadowCardState extends State<ShadowCard> {
  // initial state
  int shadowLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Shadow Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        // remove drop shadow
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // when triggered, setState rebuild widget with the new state.
          setState(() {
            shadowLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/2.jpg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 80,
              color: Colors.grey[800],
            ),
            Text(
              'NAME',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            // trick to creating space between widgets
            SizedBox(height: 10),
            Text(
              'Martin Mwiti',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Current Shadow Level',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            // trick to creating space between widgets
            SizedBox(height: 10),
            Text(
              '$shadowLevel',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
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
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
