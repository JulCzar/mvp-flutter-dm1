import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

var options = BaseOptions(
  baseUrl: 'https://significado.herokuapp.com/v2',
  connectTimeout: const Duration(hours: 1).inMilliseconds,
);

var api = DioForNative(options);
