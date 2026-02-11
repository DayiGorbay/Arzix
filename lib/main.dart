import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_flags/country_flags.dart';
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

      home: const HomePage(),
      
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),   

      appBar: AppBar( 

        backgroundColor: Color.fromARGB(255, 255, 255, 255), 
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
                  SizedBox(width: 5,),
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

                    borderRadius: BorderRadius.all(Radius.circular(999)),
                    color: Color.fromARGB(255, 130, 130, 130),

                  ),

                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Row(

                        children: [

                          Icon(CupertinoIcons.list_dash, color: Colors.white,),
                          SizedBox(width: 8),
                          Text("نام آزاد ارز", style: textTheme.headlineLarge),

                        ],

                      ),

                      Row(

                        children: [

                          Icon(CupertinoIcons.money_dollar, color: Colors.white,),
                          SizedBox(width: 2),
                          Text("قیمت", style: textTheme.headlineLarge),

                        ],

                      ),
                
                      Row(

                        children: [

                          Icon(CupertinoIcons.chart_bar, color: Colors.white,),
                          SizedBox(width: 10),
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

                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                //   // color: Color.fromARGB(255, 226, 226, 226),
                  
                // ),

                // physics: BouncingScrollPhysics(), 
                child: ListView.separated(physics: BouncingScrollPhysics(), itemCount: 20, itemBuilder: (BuildContext context, int position){

                  return Padding(

                    padding: const EdgeInsets.fromLTRB(0,15,0,0),
                    child: ItemsContainerForMoneyWidget(),

                  );

                }, separatorBuilder: (BuildContext context, int index) {  

                  if (index%9==3) {

                    return Padding(

                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: AdContainerForMoneyWidget(),

                    );


                  } else {

                    return SizedBox.shrink();

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
                    icon: Icon(CupertinoIcons.refresh_bold, color: Colors.white,), 
                    label: Text("بروزرسانی لیست ارز", style: textTheme.headlineLarge),
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 166, 71, 255))),
                    
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
  const ItemsContainerForMoneyWidget({
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
    
          BoxShadow(blurRadius: 1.0,color: Colors.grey,)
    
        ],
      
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(999))
      
      ),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
    
          Row(
    
            children: [
    
              CountryFlag.fromCountryCode(
                'US',
                theme: const ImageTheme(
                  shape: RoundedRectangle(3),
                  width: 30,
                  height: 20,
                ),
              ),
    
              SizedBox(width: 10,),
    
              Text("دلار آمریکا", style: textTheme.headlineMedium),
    
            ],
    
          ),

          Row(

            children: [

              Text("145000", style: textTheme.headlineMedium),
              SizedBox(width: 5),
              Text("تومان", style: textTheme.headlineMedium),

            ],

          ),

          Row(

            children: [

              Icon(CupertinoIcons.up_arrow),
              SizedBox(width: 5),
              Text("2300+", style: textTheme.headlineMedium),  

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
    
          BoxShadow(blurRadius: 1.0,color: Colors.grey,)
    
        ],
      
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(999))
      
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