import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppString {
  AppString._();
  static String rapidApiKey = dotenv.env['X-RapidAPI-Key'] ?? "";
  static String rapidApiHosts = dotenv.env['X-RapidAPI-Host'] ?? "";
  static String allChapters = dotenv.env['All-Chapters'] ?? "";
}
