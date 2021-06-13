import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data['isDayTime']);
    String dimage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('lib/assets/' + dimage))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic reslt =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data['location'] = reslt['location'];
                      data['time'] = reslt['time'];
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Location'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 28, letterSpacing: 2),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
