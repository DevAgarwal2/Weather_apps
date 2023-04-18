import 'package:flutter/material.dart';
import "package:quoteapp/models/container.dart";


class CityScreen extends StatefulWidget {
  
  @override
  _CityScreenState createState() => _CityScreenState();
  
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController _controller = TextEditingController();
  late String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/city.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  
                  controller: _controller,
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city,color: Colors.black87,),
                      hintText: "Enter the Location",
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (value) {
                      city = value;
                    },
                  
                ),
              
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context,city);
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
