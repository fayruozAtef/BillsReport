import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bills_report/presentation/screens/report_screen.dart';
import 'core/services/services_locator.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:const [
         Locale('en'),
         Locale('ar'),
      ],
      locale: const Locale('ar'),
      title: ' Bills Reports',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
      ),
      home: const ReportScreen(),
    );
  }
}
