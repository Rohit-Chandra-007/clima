import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const weatherApiKey = '2a7d7142e87405cc94521601a67ab33a';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$weatherApiKey');
    var weatherData = await networkHelper.getData();

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return const LocationScreen();
    // }));
    var temp = weatherData['main']['temp'];
    print(temp);
    var condition = weatherData['weather'][0]['id'];
    print(condition);
    var name = weatherData['name'];
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
// body: Center(
//           child: SpinKitDoubleBounce(
//         color: Colors.white,
//         size: 100.0,
//       )),