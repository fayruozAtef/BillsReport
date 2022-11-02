import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bills_report/presentation/screens/report_screen.dart';
import 'core/cach_helper/cach_helper.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_constant.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await CashHelper.init();
  final String? language= CashHelper.getStringData(key: getLanguageKey);
  runApp( MyApp(language: language,));

}

class MyApp extends StatefulWidget {
  MyApp({super.key,required this.language});
  // This widget is the root of your application.
  String? language;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return (widget.language !=null)? MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:const [
         Locale('en'),
         Locale('ar'),
      ],
      locale: Locale(widget.language!),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.teal,
      ),
      home: const ReportScreen(),
    ):MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor,elevation: 0.0,),
        body: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color:Colors.black),
              boxShadow: const [
                BoxShadow(color: Colors.grey, offset: Offset(0.0, 1.0),),
              ],
              color: Colors.grey[100],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                        "Pick your language: ",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async{
                          await CashHelper.putStringData(key: getLanguageKey, value: "en");
                          await CashHelper.putBoolData(key: isArabicLanguage, value: false);
                          setState(() {
                            widget.language= CashHelper.getStringData(key: getLanguageKey);
                          });
                          },
                        child:const Text(
                          "English",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () async{
                          await CashHelper.putStringData(key: getLanguageKey, value: "ar");
                          await CashHelper.putBoolData(key: isArabicLanguage, value: true);
                          setState(() {
                            widget.language= CashHelper.getStringData(key: getLanguageKey);
                          });

                        },
                        child: const Text(
                          "العربية",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                ],
            ),
          ),
        ),
      ),
    );
  }
}
