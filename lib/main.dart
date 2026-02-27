import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:arzix/Features/Home/Pages/home_page.dart';
import 'package:arzix/core/theme/theme.dart';

Future<void> main () async {

  await dotenv.load(fileName: ".env");
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arzix',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'),
      ],

      theme: AppTheme.lightTheme,
      
      home: HomePage(),
      
    );
  }
}


// String _gettime() {

//   DateTime dateTime = DateTime.now();

//   return DateFormat('hh:mm:ss').format(dateTime);

// }

