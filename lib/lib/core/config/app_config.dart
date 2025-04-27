// lib/core/config/app_config.dart

import 'environment.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  static AppConfig get instance => _instance;

  AppConfig._internal();

  // API Configuration
  late String apiBaseUrl;
  late String apiKey;
  late int apiTimeout;

  // App Configuration
  late String appName;
  late String appVersion;
  late String buildNumber;
  late bool isDarkTheme;
  late bool isDebugMode;

  // Content Configuration
  late int contentCacheTimeInMinutes;
  late int maxDownloads;
  late bool enablePremiumFeatures;

  // Player Configuration
  late bool enableAutoPlay;
  late bool enablePictureInPicture;
  late bool enableBackgroundPlay;
  late int defaultPlaybackQuality;

  void initialize({required Environment environment}) {
    switch (environment) {
      case Environment.development:
        _initDevelopment();
        break;
      case Environment.staging:
        _initStaging();
        break;
      case Environment.production:
        _initProduction();
        break;
    }
  }

  void _initDevelopment() {
    apiBaseUrl = 'https://dev-api.ottapp.com/v1';
    apiKey = 'dev_api_key';
    apiTimeout = 30; // seconds

    appName = 'OTT Stream Dev';
    appVersion = '1.0.0';
    buildNumber = '1';
    isDarkTheme = true;
    isDebugMode = true;

    contentCacheTimeInMinutes = 5;
    maxDownloads = 100;
    enablePremiumFeatures = true;

    enableAutoPlay = true;
    enablePictureInPicture = true;
    enableBackgroundPlay = true;
    defaultPlaybackQuality = 720; // HD
  }

  void _initStaging() {
    apiBaseUrl = 'https://staging-api.ottapp.com/v1';
    apiKey = 'staging_api_key';
    apiTimeout = 20; // seconds

    appName = 'OTT Stream Staging';
    appVersion = '1.0.0';
    buildNumber = '1';
    isDarkTheme = true;
    isDebugMode = true;

    contentCacheTimeInMinutes = 10;
    maxDownloads = 50;
    enablePremiumFeatures = true;

    enableAutoPlay = true;
    enablePictureInPicture = true;
    enableBackgroundPlay = true;
    defaultPlaybackQuality = 720; // HD
  }

  void _initProduction() {
    apiBaseUrl = 'https://api.ottapp.com/v1';
    apiKey = 'production_api_key';
    apiTimeout = 10; // seconds

    appName = 'OTT Stream';
    appVersion = '1.0.0';
    buildNumber = '1';
    isDarkTheme = true;
    isDebugMode = false;

    contentCacheTimeInMinutes = 30;
    maxDownloads = 25;
    enablePremiumFeatures = false;

    enableAutoPlay = true;
    enablePictureInPicture = true;
    enableBackgroundPlay = false;
    defaultPlaybackQuality = 480; // SD by default, users can change
  }
}