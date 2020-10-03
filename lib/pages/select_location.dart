import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_clock/util/world_time.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  // create list of locations to choose from
  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagUrl: 'kenya.png'),
    WorldTime(url: 'Africa/Gaborone', location: 'Gaborone', flagUrl: 'botswana.png'),
    WorldTime(url: 'America/Barbados', location: 'Barbados', flagUrl: 'barbados.png'),
    WorldTime(url: 'America/Jamaica', location: 'Jamaica', flagUrl: 'jamaica.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flagUrl: 'spain.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires', flagUrl: 'argentina.png'),
    WorldTime(url: 'Africa/Sao_Tome', location: 'Sao Tome', flagUrl: 'standp.png'),
  ];

  void updateLocation (index) async {
    //get new location with its index
    WorldTime newLocation = locations[index];
    //get new locations time
    await newLocation.getDateTime();
    // get details from new location and navigate to home screen
    Navigator.pop(context, {
      'location': newLocation.location,
      'flagUrl': newLocation.flagUrl,
      'time': newLocation.time,
      'isDay': newLocation.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateLocation(index);
                },
                title: Text(locations[index].location),
                leading: Image.asset('assets/${locations[index].flagUrl}'),
                ),
              ),
           );
        }
        ),
    );
  }
}
