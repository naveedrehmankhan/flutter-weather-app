import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:wather/TurchApp.dart';
import 'package:wather/cloud.dart';
import 'package:weather/weather.dart';
import 'package:flutter_ios_calculator/flutter_ios_calculator.dart';

//void main() => runApp(cloud());

class cloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MyApp(),
    );
  }
}

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  late WeatherFactory ws;
  List<Weather> _data = [];
  AppState _state = AppState.NOT_DOWNLOADED;
  double? lat = 25.3960, lon = 68.3578;

  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
  }

  // GetCalculator() {
  //   return
  // }

  void queryForecast() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      _state = AppState.DOWNLOADING;
    });

    List<Weather> forecasts = await ws.fiveDayForecastByLocation(lat!, lon!);
    setState(() {
      _data = forecasts;
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  void queryWeather() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _state = AppState.DOWNLOADING;
    });

    Weather weather = await ws.currentWeatherByLocation(lat!, lon!);
    setState(() {
      _data = [weather];
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  // void GetCalculator() {
  //   Calculator(
  //     calculatorType: CalculatorType.ios12, //Defaults to CalculatorType.ios12
  //   );
  // }

  Widget weatherApp() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[_buttons(), Expanded(child: _resultView())],
      ),
    );
  }

  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.red,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: IconButton(
                    iconSize: 25,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.yellow,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 500,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      '${_data[index].areaName}',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("img/D.png"))),
                ),
                Container(
                  height: 100,
                  width: 500,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      '${_data[index].temperature}\u00B0',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 450,
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapSample()));
                        },
                        title: Text(
                          '${_data[index].areaName} , ${_data[index].country}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      ListTile(
                        leading: Icon(
                          Icons.cloud,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          '${_data[index].cloudiness}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text("cloudness"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapSample()));
                        },
                      ),
                     return ListTile(
  title: Text(
    _suggestions[index].asPascalCase,
    style: _biggerFont,
  ),
  trailing: Icon(
    alreadySaved ? Icons.favorite : Icons.favorite_border,
    color: alreadySaved ? Colors.red : null,
    semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
  ),
  onTap: () {          // NEW from here ...
    setState(() {
      if (alreadySaved) {
        _saved.remove(_suggestions[index]);
      } else {
        _saved.add(_suggestions[index]);
      }
    });                // to here.
  },
);

                      ListTile(
                        leading: Icon(
                          Icons.wind_power_outlined,
                          color: Colors.grey,
                        ),
                        title: Text(
                          '${_data[index].windSpeed}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text("WindSpeed"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          '${_data[index].humidity}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text("Humidity"),
                      ),
                      ListTile(
                        leading: Icon(Icons.contactless_sharp),
                        title: Text(
                          '${_data[index].pressure}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text("Pressure"),
                      ),
                      ListTile(
                        leading: Icon(Icons.cloud_sync_outlined),
                        title: Text(
                          '${_data[index].tempMax}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text("TempMAX"),
                      ),
                      ListTile(
                        title: Text(
                          '${_data[index].sunset}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.timer),
                      ),

                      //ListTile(
                      //title: Text('${_data[index].weatherConditionCode}',
                      //style: TextStyle(
                      //fontSize: 15,
                      //fontWeight: FontWeight.bold,
                      //),),      ),                ListTile(
                      //title: Text('${_data[index].weatherDescription}',
                      //style: TextStyle(
                      //fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      //  ),),      ),                ListTile(
                      //title: Text('${_data[index].weatherIcon}',
                      //style: TextStyle(
                      //fontSize: 15,
                      //  fontWeight: FontWeight.bold,
                      //  ),),      ),
                      //ListTile(
                      //title: Text('${_data[index].weatherMain}',
                      //style: TextStyle(
                      //fontSize: 15,
                      //  fontWeight: FontWeight.bold,
                      //  ),),      ),

                      //ListTile(
                      //title: Text('${_data[index].windDegree}',
                      //style: TextStyle(
                      //fontSize: 15,
                      //  fontWeight: FontWeight.bold,
                      //  ),),      ),
                      //  ListTile(
                      //  title: Text('${_data[index].windGust}',
                      //   style: TextStyle(
                      //    fontSize: 15,
                      //    fontWeight: FontWeight.bold,
                      //   ),),      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget contentDownloading() {
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(children: [
        Text(
          'Fetching Weather...',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
      ]),
    );
  }

  Widget contentNotDownloaded() {
    return Center();
  }

  Widget _resultView() => _state == AppState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == AppState.DOWNLOADING
          ? contentDownloading()
          : contentNotDownloaded();

  void _saveLat(String input) {
    lat = double.tryParse(input);
    print(lat);
  }

  void _saveLon(String input) {
    lon = double.tryParse(input);
    print(lon);
  }

  Widget _coordinateInputs() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              color: Colors.white70,
              margin: EdgeInsets.all(5),
              child: TextField(
                  decoration: InputDecoration(hintText: 'Enter 25.3960'),
                  keyboardType: TextInputType.number,
                  onChanged: _saveLat,
                  onSubmitted: _saveLat)),
        ),
        Expanded(
            child: Container(
                color: Colors.white70,
                margin: EdgeInsets.all(5),
                child: TextField(
                    decoration: InputDecoration(hintText: 'Enter 68.3578'),
                    keyboardType: TextInputType.number,
                    onChanged: _saveLon,
                    onSubmitted: _saveLon)))
      ],
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Color.fromARGB(255, 1, 3, 7),

          leading: IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.location_on,
              color: Colors.yellow,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapSample()));
            },
          ),

          actions: [
            IconButton(
              iconSize: 35,
              icon: Icon(
                Icons.autorenew_outlined,
                color: Colors.yellowAccent,
              ),
              onPressed: queryWeather,
            ),
          ],

          //  actions: [],
          backgroundColor: Colors.red,
          title: Text(
            'Weather&Map',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 23,
                color: Color.fromARGB(255, 210, 201, 201)),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'img/clouds.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              _buttons(),
              Expanded(child: _resultView()),
            ],
          ),
        ),
      ),
    );
  }
}
