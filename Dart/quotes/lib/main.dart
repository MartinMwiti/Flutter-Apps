import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(home: QuoteList()));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
  // The framework calls createState the first time a widget
  // appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses the State object
  // instead of creating a new State object.
}

// class object
class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: 'Oscar',
        text: "The way to get started is to quit talking and begin doing."),
    Quote(
        author: 'Oscar',
        text:
            "All our dreams can come true, if we have the courage to pursue them."),
    Quote(
        author: 'Oscar',
        text:
            "Your time is limited, so don't waste it living someone else's life."),
  ];

  @override
  Widget build(BuildContext context) {
    // This method(build) is rerun every time setState is called,
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        // map fun will cycle through list a list of data & perform a func to each item on the list.
        // children expect a list. So use 'toList()' to turn the iterable to list
        // QuoteCard() return new instance
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
