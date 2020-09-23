import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  //  Constructor(named parameter) - Shorter code
  WorldTime({this.location, this.flag, this.url});

  // Make request
  // Future(like promises) is a temporary placeholder value until func is complete. In this case, it's saying, it'll return a void but only after the async func is fully complete.
  Future<void> getTime() async {
    try {
      // store value inside Response object. Response is provided by the http module. sort of 'res'
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['utc_datetime'];
      // substring. go from pos 1-3. remove the '+' or '-'
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'could not get time data';
    }
  }
}
