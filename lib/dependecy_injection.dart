import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

void init(){
  locator.allowReassignment = true;
  
}
