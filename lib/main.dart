import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syau_sewa_mobile/app/app.dart';
import 'package:syau_sewa_mobile/core/di/dependency_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final sharedPref = await SharedPreferences.getInstance();

    await setUpDependencies(preferences: sharedPref);
    runApp(const MyApp());
  } catch (e) {
    print("Application initialization failed");
    rethrow;
  }
}
