import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:investify/features/control_page.dart';
import 'package:investify/features/splash_screen.dart/presentation/splash_veiw.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage().initStorage;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashView());
  }
}
