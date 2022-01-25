import 'package:flutter/material.dart';

class CityScreen extends StatelessWidget {
  static const id = 'city_screen';
  late String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50,
                  color: Color(0xFFFFD059),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter the city',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  filled: true,
                  icon: Icon(
                    Icons.location_city,
                    color: Color(0xFFFFD059),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  city = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context,city);
              },
              child: Text('Get Weather',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFFFD059),
                      fontFamily: 'Spartan MB')),
            )
          ],
        ),
      ),
    );
  }
}
