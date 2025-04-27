// lib/core/utils/logger.dart

import 'package:logger/logger.dart';
import '../config/app_config.dart';

class AppLogger {
  static final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static void d(dynamic message) {
    if (AppConfig.instance.isDebugMode) {
      _logger.d(message);
    }
  }

  static void i(dynamic message) {
    if (AppConfig.instance.isDebugMode) {
      _logger.i(message);
    }
  }

  static void w(dynamic message) {
    if (AppConfig.instance.isDebugMode) {
      _logger.w(message);
    }
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (AppConfig.instance.isDebugMode) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }

  static void v(dynamic message) {
    if (AppConfig.instance.isDebugMode) {
      _logger.v(message);
    }
  }

  static void wtf(dynamic message) {
    if (AppConfig.instance.isDebugMode) {
      _logger.wtf(message);
    }
  }
}