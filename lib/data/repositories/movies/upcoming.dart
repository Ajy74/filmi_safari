import 'dart:convert';

import 'package:filmi_safari/data/models/upcoming_movie_model.dart';
import 'package:filmi_safari/data/repositories/api/movie_api.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Upcoming {

  static Future<UpcomingMovieModel> getUpcoming() async {

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Get the date one month later
    DateTime nextMonthDate = currentDate.add(const Duration(days: 60));
    
    // Format the dates as strings in "yyyy-MM-dd" format
    String formattedCurrentDate = DateFormat('yyyy-MM-dd').format(currentDate);
    String formattedNextMonthDate = DateFormat('yyyy-MM-dd').format(nextMonthDate);
    
    try {
      final response = await http.get(
        Uri.parse("${API.upcomingIndia}&release_date.gte=$formattedCurrentDate&release_date.lte=$formattedNextMonthDate"),
      );

      if(response.statusCode == 200){
        dynamic data = jsonDecode(response.body);
        return UpcomingMovieModel.fromJson(data);
      }
      else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error: $ex');
      throw Exception('Failed to load data: $ex');
    }
  }

  static Future<UpcomingMovieModel> getUpcomingPages(int page) async {

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Get the date one month later
    DateTime nextMonthDate = currentDate.add(const Duration(days: 60));
    
    // Format the dates as strings in "yyyy-MM-dd" format
    String formattedCurrentDate = DateFormat('yyyy-MM-dd').format(currentDate);
    String formattedNextMonthDate = DateFormat('yyyy-MM-dd').format(nextMonthDate);
    
    try {
      final response = await http.get(
        Uri.parse("${API.upcomingIndia}&release_date.gte=$formattedCurrentDate&release_date.lte=$formattedNextMonthDate&page=$page"),
      );

      if(response.statusCode == 200){
        dynamic data = jsonDecode(response.body);
        return UpcomingMovieModel.fromJson(data);
      }
      else{
        throw Exception('Failed to load more: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error: $ex');
      throw Exception('Failed to load more: $ex');
    }
  }

}