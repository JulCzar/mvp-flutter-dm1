import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

var options = BaseOptions(
  baseUrl: 'https://significado.herokuapp.com/v2',
  connectTimeout: 5000,
);

var api = DioForNative(options);
