import '../exports/app_export.dart';

/// *****************************************************************************
///Created By Aman Mishra
///****************************************************************************
class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      debugPrint("Error:$data$stackTrace");
    }
  }
}

enum LogMode { debug, live }
