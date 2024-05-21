import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:week7/api_service.dart';
import 'package:week7/model/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Dio dio;
  Welcome? weatherData;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    dio = Dio();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    String apiKey = "53717c644a0e86f7bd5eabe8bc391ac1";
    String cityName = "kor";

    try {
      Welcome model = await ApiService(Dio()).getWeather(cityName, apiKey);
      setState(() {
        weatherData = model;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GDSC 모바일 스터디',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            )
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(

          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white54,
                  surfaceTintColor: Colors.white54,
                  foregroundColor: Colors.black
              ),
              onPressed: fetchData,
              child: const Text('날씨 API 받기!!'),
            ),
            Text("기온 : ${weatherData?.main.temp ?? "No Data~"}"),
            Text(
                "습도 : ${weatherData?.main.humidity ?? "No Data~"}"),
            Text(
                "기압 : ${weatherData?.main.pressure ?? "No Data~"}"),
            Text(
                "풍속 : ${weatherData?.wind.speed ?? "No Data~"}"),
          ],
        ),
      ),
    );
  }
}
