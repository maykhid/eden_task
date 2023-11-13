import 'package:flutter_dotenv/flutter_dotenv.dart';

const String ablyApiKeyRef = 'ablyApiKey';

class ApiConfig {
  static String get ablyApiKey => dotenv.env[ablyApiKeyRef] ?? '';
}
