import 'package:find_my_doctor/App/locator.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;
@injectableInit
Future<void> configure() => $initGetIt(locator);