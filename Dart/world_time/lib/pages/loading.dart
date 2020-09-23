import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // initial value before getting the data
  String time = 'loading';

  void setupWorldTime() async {
    // creating an instance
    WorldTime instance = WorldTime(
        location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  // override the original initState from State<ChooseLocation> class
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),
      ),
    );
  }
}
