import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/weather_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/weather?q={cityName}&appid={apiKey}')
  Future<Welcome> getWeather(
      @Query('q') String cityName,
      @Query('appid') String apiKey,
      );
}