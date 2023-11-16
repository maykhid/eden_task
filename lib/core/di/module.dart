import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden_task/core/data/api_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  Realtime get realtime {
    // Create an instance of ClientOptions with Ably key
    final clientOptions = ClientOptions(key: ApiConfig.ablyApiKey);

    return Realtime(options: clientOptions);
  }

  @singleton
  RealtimeChannel get realtimeChannel {
    const channelName = 'getting-started';
    return RealtimeChannel(realtime, channelName);
  }
}
