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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.attach_money, "ارز", 0),
            navItem(Icons.currency_bitcoin, "رمز ارز", 1),
            navItem(Icons.account_balance_wallet, "طلا", 2),
            navItem(Icons.settings, "تنظیمات", 3),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: isActive ? Colors.grey.shade200 : Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 26,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}