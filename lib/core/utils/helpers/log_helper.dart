// for pretty printing and better readability of log messages 
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0, // don’t show stack trace
    errorMethodCount: 5, // show stack trace for errors only
    lineLength: 50, // wrap log messages after 50 characters
    colors: true, // colorize log messages
    printEmojis: true, // print an emoji for each log message
    dateTimeFormat: DateTimeFormat.dateAndTime, // show date and time in log messages
    noBoxingByDefault: true,
  ),
);

/* logger.t("trace message");
// 🔍 2026-03-10 14:23:45  trace message

logger.d("debug message");
// 🐛 2026-03-10 14:23:45  debug message

logger.i("info message");
// 💡 2026-03-10 14:23:45  info message

logger.w("warning message");
// ⚠️ 2026-03-10 14:23:45  warning message

logger.e("error message");
// ⛔ 2026-03-10 14:23:45  error message
//   #0  AuthDBService.signIn (auth_db_service.dart:45)
//   #1  AuthBloc._onSignIn (auth_bloc.dart:32)
//   #2  ...
//   #3  ...
//   #4  ...

logger.f("fatal message");
// 👾 2026-03-10 14:23:45  fatal message
//   #0  AuthDBService.signIn (auth_db_service.dart:45)
//   #1  ... */