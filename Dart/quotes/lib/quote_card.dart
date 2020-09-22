import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  // create variable called 'quote' which is a 'Quote' object.
  // adding final to state that the data won't change since i'm working in a stateless widget
  final Quote quote;
  // final since it's a stateless widget. Function is the type
  final Function delete;

  // constructor(named parameters)
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 6),
            Text(
              '- ' + quote.author,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            SizedBox(height: 8),
            FlatButton.icon(
              // call 'delete' func.
                onPressed: delete,
                icon: Icon(Icons.delete),
                label: Text('Delete quote'))
          ],
        ),
      ),
    );
  }
}
