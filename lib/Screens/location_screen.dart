import 'package:clima_flutter/Screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/Services/weather.dart';
class LocationScreen extends StatefulWidget {
  static const id = 'location_screen';

  final locationWeather;
LocationScreen({this.locationWeather});
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late String cond;
  late String cityName;
  late String icon;
  late String msg;

  WeatherModel weather=WeatherModel();

  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
}


  void updateUI(dynamic weatherData)
  {
    setState(() {
      if(weatherData==null)
        {
          temp=0;
          icon='error';
          msg='unable to fetch data';
          cityName=' ';
          return ;
        }
      cityName=weatherData['name'];
      var cond=weatherData['weather'][0]['id'];
      double temperature=weatherData['main']['temp'];
      temp=temperature.toInt();
      icon=weather.getWeatherIcon(temp);
      msg=weather.getMessage(temp);
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF17184A),
        body: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async{
                        var weatherData= await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50,
                        color: Color(0xFFFFD059),
                      ),
                    ),
                    TextButton(
                      onPressed: () async{
                      var typedName=await Navigator.pushNamed(context, CityScreen.id);
                      if(typedName!=null)
                        {
                          var weatherData=await weather.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50,
                        color: Color(0xFFFFD059),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        '$temp C',
                        style: TextStyle(
                          fontFamily: 'Spartan MB',
                          fontSize: 80,
                          color: Color(0xFFFFD059),
                        ),
                      ),
                      Text(
                        '$icon',
                        style: TextStyle(
                          fontSize: 80,
                          color: Color(0xFFFFD059),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text('$msg in $cityName',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 80,
                        color: Color(0xFFFFD059),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
