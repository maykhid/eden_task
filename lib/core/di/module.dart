
import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden_task/core/data/api_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  RealtimeChannel get realtimeChannel {
    // Create an instance of ClientOptions with Ably key
    final clientOptions = ClientOptions(key: ApiConfig.ablyApiKey);
    const channelName = 'getting-started';

    final realtime = Realtime(options: clientOptions)
      ..connection.on().listen((stateChange) {
        debugPrint('Ably Connection State: ${stateChange.current.name}');
      });

    return RealtimeChannel(realtime, channelName);
  }
}
