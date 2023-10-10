import 'dart:convert';

import 'package:filmi_safari/data/models/recent_movie_model.dart';
import 'package:filmi_safari/data/repositories/api/movie_api.dart';
import 'package:http/http.dart' as http;

class NowPlayingMovies {

  static Future<RecentMovieModel> getRecentIndia() async {
    try {
      final response = await http.get(
        Uri.parse(API.recentIndiaBaseUrl),
      );

      if(response.statusCode == 200){
        dynamic data = jsonDecode(response.body);
        return RecentMovieModel.fromJson(data);
      }
      else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error: $ex');
      throw Exception('Failed to load data: $ex');
    }

  }

  //^ get recent india all pages
  static Future<RecentMovieModel> getRecentIndiaPages(int page) async {
    try {
      final response = await http.get(
        Uri.parse("${API.recentIndiaBaseUrl}&page=$page"),
      );

      if(response.statusCode == 200){
        dynamic data = jsonDecode(response.body);
        return RecentMovieModel.fromJson(data);
      }
      else{
        throw Exception('Failed to load more: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error: $ex');
      throw Exception('Failed to load more: $ex');
    }
  } 

  static Future<RecentMovieModel> getRecentWorld() async {
    try {
      final response = await http.get(
        Uri.parse(API.recentInternationalBaseUrl),
      );

      if(response.statusCode == 200){
        dynamic data = jsonDecode(response.body);
        return RecentMovieModel.fromJson(data);
      }
      else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error: $ex');
      throw Exception('Failed to load data: $ex');
    }
  }

  //^ get recent world all pages
  static Future<RecentMovieModel> getRecentWorldPages(int page) async {
    try {
      final response = await http.get(
        Uri.parse("${API.recentInternationalBaseUrl}&page=$page"),
      );

      if(response.statusCode == 200){
        dynamic data = jsonDecode(response.body);
        return RecentMovieModel.fromJson(data);
      }
      else{
        throw Exception('Failed to load more: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error: $ex');
      throw Exception('Failed to load more: $ex');
    }
  } 

  static Future<RecentMovieModel> getRecentHindi() async {
    try {
      final response = await http.get(
        Uri.parse(API.recentHindiBaseUrl),
      );

      if(response.statusCode == 200){
        dynamic data = jsonDecode(response.body);
        return RecentMovieModel.fromJson(data);
      }
      else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error: $ex');
      throw Exception('Failed to load data: $ex');
    }
  }

}