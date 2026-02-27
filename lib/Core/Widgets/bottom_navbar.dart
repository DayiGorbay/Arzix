import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  final Function(int)? onTabChanged;
  final int currentIndex;

  const BottomNavbar({super.key, this.onTabChanged, this.currentIndex = 0});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    if (widget.onTabChanged != null) {
      widget.onTabChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double circleWidth = 50;
    final double circleHeight = 40;

    // Align of Circle - RTL
    double alignmentX(int index) {
      int itemCount = 4;
      if (index == 1 || index == 2) {
        return 0.9 - (index * 1.69 / (itemCount - 1));
      }
      return 0.88 - (index * 1.7 / (itemCount - 1));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow( 
              color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.2), 
              blurRadius: 20, 
              offset: const Offset(0, 10), 
            ), 
            BoxShadow( 
              color: const Color.fromARGB(255, 226, 226, 226),  
              // blurRadius: 20, 
              offset: const Offset(0, 5), 
            ) 
          ],
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Animation Circle
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              alignment: Alignment(alignmentX(currentIndex), -0.7),
              child: Container(
                width: circleWidth,
                height: circleHeight,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),

            // Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navItem(Icons.attach_money, "ارز", 0),
                navItem(Icons.currency_bitcoin, "رمز ارز", 1),
                navItem(Icons.account_balance_wallet, "طلا", 2),
                navItem(Icons.settings, "تنظیمات", 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 29,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}