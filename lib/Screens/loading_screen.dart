import 'package:flutter/material.dart';
import 'package:clima_flutter/Screens/location_screen.dart';
import 'package:clima_flutter/Services/weather.dart';


class LoadingScreen extends StatefulWidget {
  static const id='loading_screen';


  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async
  {

    WeatherModel weatherModel=WeatherModel();
    var weatherData=await weatherModel.getLocationWeather();

    Navigator.push(context,MaterialPageRoute(builder:(context)
    {
      return LocationScreen(locationWeather:weatherData);
    }));

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xFF17184A),
        body:Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Images/cloudy.png',
                width: 350,
                height: 220,
              ),
              Text(
                'Weather Feed',
                style: TextStyle(
                  fontFamily: 'OleoScript',
                  fontSize: 40.0,
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height:45,
              ),
              Material(
                  color:Color(0xFFFFD059),
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child:MaterialButton(
                      minWidth: 200,
                      height:42.0,
                      onPressed: () {
                        getLocation();
                      },
                      child:Text(
                          'Get Started',
                          style:TextStyle(
                            color:Color(0xFF2E2010),
                          )
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}
