import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import 'register_module.dart';
import 'network_module.dart';
import 'storage_module.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: 'init', asExtension: true)
Future<void> configureDependencies(AppConfig config) async {
  getIt.registerSingleton<AppConfig>(config);

  await getIt.init();
}
