import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set bg
    String bgImage = data['isDay'] ? 'bg_day.jpg' : 'bg_night.jpg';
    Color statusBg = data['isDay'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: statusBg,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 80.0, 8.0, 8.0),
              child: Column(
                children: [
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        //update data with result from push
                        data = {
                          'location': result['location'],
                          'flagUrl': result['flagUrl'],
                          'time': result['time'],
                          'isDay': result['isDay']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.add_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                        'change location',
                        style: TextStyle(
                            color: Colors.grey[300]),
                        ),
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 24.0,
                          letterSpacing: 1.5,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 64.0,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
