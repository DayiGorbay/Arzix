import 'package:flutter/material.dart';
import 'package:arzix/Features/Home/Widgets/bottom_navbar.dart';
import 'package:arzix/Features/Home/Pages/currency_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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

            Image.asset("assets/images/arzix_logo.png", width: 60, height: 60),
            Text(
              "اَرزیـــکس",
              style: Theme.of(context).appBarTheme.toolbarTextStyle,
            ),

          ],

        ),
                  
      ),

      body: getPage(selectedIndex),
      
      bottomNavigationBar: BottomNavbar(
        currentIndex: selectedIndex,
        onTabChanged: (index) {
          setState(() {
            selectedIndex = index;
            print("Selected Index: $selectedIndex");
          });
        },
      ),

    );

  }

  Widget getPage(int index) {
    switch(index) {
      case 0:
        return const CurrencyPage(); // Currency Page (default page)
      case 1:
        return const CurrencyPage(); // Crypto Page
      case 2:
        return const CurrencyPage(); // Gold Page
      case 3:
        return const CurrencyPage(); // Setting Page
      default:
        return const CurrencyPage();
    }
  }

}