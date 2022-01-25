import 'package:clima_flutter/Services/loc.dart';
import'package:clima_flutter/Services/network.dart';

const apiKey='ba3c079796b7b43af38d69a4d0926e57';

class WeatherModel {

  Future<dynamic> getCityWeather(var city)async
  {
    var url='https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getData();

    return weatherData;
  }
  Future<dynamic> getLocationWeather()async
  {
    Location location=Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData=await networkHelper.getData();
    var cityName=weatherData['name'];
    var cond=weatherData['weather'][0]['id'];
    double temperature=weatherData['main']['temp'];
    print(weatherData);
    print(cityName);
    print(cond);
    print(temperature);
    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp <= 10) {
      return 'You\'ll need 🧣 and 🧤';
    }
     else if (temp >= 20 && temp<25) {
      return 'Time for shorts and 👕';
    }
    else if (temp >=25) {
   return 'It\'s 🍦 time';
    }
    else {
      return 'Bring a 🧥 just in case';
    }

  }
}

