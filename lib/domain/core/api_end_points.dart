import 'package:netflix/Infrastructure/api_key.dart';
import 'package:netflix/core_items/strings.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}
