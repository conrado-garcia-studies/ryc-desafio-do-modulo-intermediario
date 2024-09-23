import 'package:logger/logger.dart';

Logger get logger => AppLogger.instance;

class AppLogger extends Logger {
  AppLogger._() : super(printer: PrettyPrinter());
  static final AppLogger instance = AppLogger._();
}
