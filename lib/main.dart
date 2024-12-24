import 'package:flutter/material.dart';
import 'package:flutter_practice/features/home/presentation/pages/home_page.dart';

import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter practice',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
