import 'package:app/services/world_time.dart';
import 'package:flutter/material.dart';

class ChoseLocation extends StatefulWidget {
  const ChoseLocation({Key? key}) : super(key: key);

  @override
  _ChoseLocationState createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {
  List<WorldTime> makan = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Algiers', location: 'algeria', flag: 'algeria.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updatetime(index) async {
    WorldTime instance = makan[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('chose a location'),
        centerTitle: true,
        elevation: 12,
      ),
      body: ListView.builder(
        itemCount: makan.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(makan[index].location),
              onTap: () {
                updatetime(index);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/' + makan[index].flag),
              ),
            ),
          );
        },
      ),
    );
  }
}
