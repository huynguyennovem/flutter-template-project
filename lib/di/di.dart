import 'package:flutter_template_project/data/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<ApiService>(ApiService());
}
