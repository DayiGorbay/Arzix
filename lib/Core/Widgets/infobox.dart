import 'package:flutter/material.dart';

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

void showInfoBox(BuildContext context,SnackType type,{required String message}) {

  // final topMargin = MediaQuery.of(context).padding.top + 500.0;

  ScaffoldMessenger.of(context).showSnackBar(

    SnackBar(

      content: Row(

        children: [

          Icon(type.icon, color: Colors.white, size: 22),
          
          const SizedBox(width: 8),

          Expanded(

            child: Text(message,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)),

          ),

        ],

      ),

      backgroundColor: type.color,
      // margin: EdgeInsets.fromLTRB(16, topMargin, 16, 0),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),

      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      elevation: 2.5,

    ),

  );

}