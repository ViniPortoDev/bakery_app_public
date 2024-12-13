import 'package:dio/dio.dart';

//Dio Customizado com a URL Base da API e os tempos de Timeout
BaseOptions options = new BaseOptions(
    // baseUrl: "http://www.example.com",
    baseUrl: "http://www.example.com",
    connectTimeout: 4000,
    receiveTimeout: 3000);

var dio = Dio(options);
