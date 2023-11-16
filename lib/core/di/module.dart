import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden_task/core/data/api_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  RealtimeChannel get realtimeChannel {
    final clientOptions = ClientOptions(key: ApiConfig.ablyApiKey);

    final realtime = Realtime(options: clientOptions);
    const channelName = 'eden';
    return RealtimeChannel(realtime, channelName);
  }
}
