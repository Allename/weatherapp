import 'package:flutter/material.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:weatherapp/services/requests.services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final weatherService = new WeatherAPI();

class _HomeScreenState extends State<HomeScreen> {
  final citiesarray = [
    'Lagos',
    'New York',
    'Dublin',
    'New Jersey',
    'Maryland',
    'Texas',
    'Florida',
    'Abuja',
  ];

  dynamic currentCity = "Lagos";

  fetchCurrentWeather() async {
    final response = await weatherService.fetch(currentCity);

    if (response != null) {
      print(response);
    }
  }

  @override
  void initState() {
    fetchCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(10.0),
            icon: Icon(Icons.location_pin),
            iconSize: 30.0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LocationScreen(),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/weather.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text(''),
              onTap: () {},
            ),
            ListTile(
              title: Text(''),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Lagos',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'January 15 2021-Friday',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
