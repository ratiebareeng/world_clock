import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for ui
  String time; // time in location
  String flagUrl; // url to asset flag icon
  String url; // location endpoint
  bool isDay = true;

  WorldTime({this.location, this.flagUrl, this.url});

  Future<void> getDateTime() async {
    try {
      //wait for the
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from json response
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create datetime
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set current time
      isDay = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch(e) {
      time = 'Error getting time data';
    }
  }
}