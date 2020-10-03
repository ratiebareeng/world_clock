import 'package:flutter/material.dart';
import 'package:world_clock/util/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Gaborone', flagUrl: 'daer.png', url: 'Africa/Gaborone');
    await worldTime.getDateTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flagUrl': worldTime.flagUrl,
      'time': worldTime.time,
      'isDay': worldTime.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.yellowAccent,
          size: 80.0,
        ),
      ),
    );
  }

}
