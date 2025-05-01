// lib/core/api/network_info.dart

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker? connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    // For web platform, always return true since InternetConnectionChecker doesn't work on web
    if (kIsWeb) {
      return true;
    }

    // For mobile platforms, use the connection checker
    return await connectionChecker?.hasConnection ?? true;
  }
}