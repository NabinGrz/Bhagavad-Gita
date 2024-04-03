import 'package:flutter_dotenv/flutter_dotenv.dart';

// X-RapidAPI-Key= 61238edbd8mshcb8d83716de8230p1053dejsn0bc6a84788b5
// X-RapidAPI-Host= bhagavad-gita3.p.rapidapi.com
// All-Chapters=v2/chapters
class AppString {
  AppString._();
  static String rapidApiKey = dotenv.env['X-RapidAPI-Key'] ?? "";
  static String rapidApiHosts = dotenv.env['X-RapidAPI-Host'] ?? "";
  static String allChapters = dotenv.env['All-Chapters'] ?? "";
}
