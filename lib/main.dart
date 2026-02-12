import 'package:arzix/model/Currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_flags/country_flags.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
// import 'package:intl/intl.dart';

void main () {

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

      theme: ThemeData(
        fontFamily: 'IranYekan',

        appBarTheme: const AppBarTheme(
          toolbarTextStyle: TextStyle(
            fontFamily: 'IranYekan',
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 78, 78, 78)
          ),
          bodySmall: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),

      home: HomePage(),
      
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  List<Currency> currency = [];

  getResponse(){

    var url = Uri.parse("https://brsapi.ir/Api/Market/Gold_Currency.php?key=BdtkpSF4bcLNShNd21pL8dCh6zCeFWG6");

    http.get(url).then((response) {


      if (response.statusCode == 200) {

        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
        List currencyList = jsonResponse["currency"];
        // List jsonResponse = convert.jsonDecode(response.body);

        if (currencyList.isNotEmpty) {

          setState(() {

            currency.clear();

            for (var item in currencyList) {
                        
              currency.add(

                Currency(

                  date: item['date'].toString(), 
                  time: item['time'].toString(), 
                  symbol: item['symbol'].toString(),
                  name_en: item['name_en'].toString(), 
                  name: item['name'].toString(), 
                  price: item['price'].toString(), 
                  change_value: item['change_value'].toString(), 
                  change_percent: item['change_percent'].toString(), 
                  unit: item['unit'].toString()

                )

              );

            }

          });

        }

      }

    });

  }

  @override
  void initState() {
    super.initState();
    getResponse();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),   

      appBar: AppBar( 
        
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
        centerTitle: true,
        title: Row(

          mainAxisSize: MainAxisSize.min,

          children: [

            Image.asset("assets/images/money.png", width: 45, height: 45),
            const SizedBox(width: 8),
            Text(
              "اَرزیـــکس",
              style: Theme.of(context).appBarTheme.toolbarTextStyle,
            ),

          ],

        ),
                  
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              // QA

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    
                  Image.asset("assets/images/information.png", width: 28, height: 28),
                  const SizedBox(width: 5,),
                  Text("نرخ ارز آزاد چیست؟", style: textTheme.bodyLarge),
        
                ],
        
              ),
        
              const SizedBox(height: 5),
        
              Text(
                """نرخ ارز آزاد قیمتی است که ارز در بازار آزاد بر اساس عرضه و تقاضا معامله می‌شود و دولت دخالت مستقیمی در تعیین آن ندارد. این نرخ معمولاً از نرخ رسمی بالاتر است و سریع‌تر تحت تأثیر شرایط اقتصادی و سیاسی تغییر می‌کند.""",
                style: textTheme.bodyMedium,
              ),
        
              const SizedBox(height: 5),

              // Arz Title Header
        
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: Container(
                  width: double.infinity,
                  height: 40,

                  decoration: BoxDecoration(

                    borderRadius: const BorderRadius.all(Radius.circular(999)),
                    color: const Color.fromARGB(255, 130, 130, 130),

                  ),

                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Row(

                        children: [

                          const Icon(CupertinoIcons.list_dash, color: Colors.white,),
                          const SizedBox(width: 8),
                          Text("نام آزاد ارز", style: textTheme.headlineLarge),

                        ],

                      ),

                      Row(

                        children: [

                          const Icon(CupertinoIcons.money_dollar, color: Colors.white,),
                          const SizedBox(width: 2),
                          Text("قیمت", style: textTheme.headlineLarge),

                        ],

                      ),
                
                      Row(

                        children: [

                          const Icon(CupertinoIcons.chart_bar, color: Colors.white,),
                          const SizedBox(width: 10),
                          Text("تغییر", style: textTheme.headlineLarge),

                        ],

                      )
         
                    ],
                
                  ),
                
                ),
              ),
        
              // Scroll Container Arz List

              SizedBox(

                width: double.infinity,
                height: 550,
                // decoration: BoxDecoration(

                //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                //   // color: Color.fromARGB(255, 226, 226, 226),
                  
                // ),

                // physics: const BouncingScrollPhysics(), 
                child: ListView.separated(physics: const BouncingScrollPhysics(), itemCount: currency.length, itemBuilder: (BuildContext context, int position){

                  return Padding(

                    padding: const EdgeInsets.fromLTRB(0,15,0,0),
                    child: ItemsContainerForMoneyWidget(position, currency),

                  );

                }, separatorBuilder: (BuildContext context, int index) {  

                  if (index%9==3) {

                    return Padding(

                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: const AdContainerForMoneyWidget(),

                    );


                  } else {

                    return const SizedBox.shrink();

                  }


                },),

              ),

              // Update Button Area

              Padding(

                padding: const EdgeInsets.fromLTRB(0,15,0,0),

                child: Container(
                
                  width: double.infinity,
                  height: 50,
                
                  decoration: BoxDecoration(
                
                    // color: Color.fromARGB(255, 232, 232, 232),
                    // color: Color.fromARGB(255, 166, 71, 255),
                    borderRadius: BorderRadius.circular(999),
                
                  ),

                  child: TextButton.icon(

                    // onPressed: ()=>_infobox(context, "لیست ارز با موفقیت بروزرسانی شد", "Success"),
                    onPressed: ()=>_infobox(context, SnackType.success, message: 'عملیات با موفقیت انجام شد'),
                    icon: const Icon(CupertinoIcons.refresh_bold, color: Colors.white,), 
                    label: Text("بروزرسانی لیست ارز", style: textTheme.headlineLarge),
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 166, 71, 255))),
                    
                  ),
                
                ),

              )

            ],
        
          ),
        
        ),

      ),

    );

  }
}

class ItemsContainerForMoneyWidget extends StatelessWidget {

  int position;
  List<Currency> currency;

  ItemsContainerForMoneyWidget(this.position, this.currency, {super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    final item = currency[position];

    final bool isNegative = item.change_value!.startsWith('-');

    final icon = isNegative
      ? CupertinoIcons.down_arrow
      : CupertinoIcons.up_arrow;

    final color = isNegative
      ? Colors.red
      : Colors.green;

    return Container(
    
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: 
    
        BoxDecoration(boxShadow:<BoxShadow>[
    
          const BoxShadow(blurRadius: 1.0,color: Colors.grey,)
    
        ],
      
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(999))
      
      ),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
    
          Row(

            crossAxisAlignment: CrossAxisAlignment.center,
    
            children: [
    
              CountryFlag.fromCurrencyCode(
                currency[position].symbol!,
                theme: const ImageTheme(
                  shape: Circle(),
                  width: 35,
                  height: 35,
                ),
              ),
    
              const SizedBox(width: 10,),

              Column(

                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: [

                  Text(currency[position].name!, style: textTheme.headlineMedium),
                  Text(currency[position].name_en!, style: textTheme.headlineMedium),

                ],

              )
    
            ],
    
          ),

          Row(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text(currency[position].price!, style: textTheme.headlineMedium),
              const SizedBox(width: 5),
              Text(currency[position].unit!, style: textTheme.headlineMedium),

            ],

          ),

          Row(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Icon(icon, color: color),
              const SizedBox(width: 5),

              Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  Text(currency[position].change_value!, style: textTheme.headlineMedium?.copyWith(color: color)),  
                  Text("${currency[position].change_percent!}%", style: textTheme.headlineMedium?.copyWith(color: color)),  

                ],

              )

            ],

          ),
    
    
        ],
    
      ),
    
    );
  }
}

class AdContainerForMoneyWidget extends StatelessWidget {
  const AdContainerForMoneyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
    
      width: double.infinity,
      height: 50,
      decoration: 
    
        BoxDecoration(boxShadow:<BoxShadow>[
    
          const BoxShadow(blurRadius: 1.0,color: Colors.grey,)
    
        ],
      
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(999))
      
      ),
    
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          // Icon(IconData ico),
          Text("تبلیغات", style: textTheme.headlineMedium?.copyWith(color: const Color.fromARGB(255, 0, 0, 0)),),
    
        ],
    
      ),
    
    );
  }
}

enum SnackType {success, error, info}

extension SnackTypeExtension on SnackType {

  IconData get icon {

    switch (this) {

      case SnackType.success:
        return Icons.check_circle;
      case SnackType.error:
        return Icons.error;
      case SnackType.info:
        return Icons.info;

    }

  }

  Color get color {

    switch (this) {

      case SnackType.success:
        return Colors.green;
      case SnackType.error:
        return Colors.red;
      case SnackType.info:
        return Colors.blue;

    }

  }

}

void _infobox(BuildContext context,SnackType type,{required String message}) {

  final topMargin = MediaQuery.of(context).padding.top + 500.0;

  ScaffoldMessenger.of(context).showSnackBar(

    SnackBar(

      content: Row(

        children: [

          Icon(type.icon, color: Colors.white, size: 22),
          
          const SizedBox(width: 8),

          Expanded(

            child: Text(message,style: Theme.of(context).textTheme.headlineMedium ?.copyWith(color: Colors.white)),

          ),

        ],

      ),

      backgroundColor: type.color,
      margin: EdgeInsets.fromLTRB(16, topMargin, 16, 0),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),

      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      elevation: 2.5,

    ),

  );

}

// String _gettime() {

//   DateTime dateTime = DateTime.now();

//   return DateFormat('hh:mm:ss').format(dateTime);

// }