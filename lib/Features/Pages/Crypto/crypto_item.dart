import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:arzix/Models/crypto.dart';
import 'package:arzix/Core/Utils/formatters.dart';

class CryptoItemWidget extends StatelessWidget {

  final Crypto item;

  const CryptoItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

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

          // Name
    
          Row(

            crossAxisAlignment: CrossAxisAlignment.center,
    
            children: [
    
              CountryFlag.fromCurrencyCode(
                item.symbol!,
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

                  Text(item.name!, style: textTheme.headlineMedium),
                  Text(item.name_en!, style: textTheme.headlineMedium),

                ],

              )
    
            ],
    
          ),

          // Price

          Row(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text(formatNumber(num.parse(item.price!)), style: textTheme.headlineMedium),
              const SizedBox(width: 5),
              Text(item.unit!, style: textTheme.headlineMedium),

            ],

          ),

          // Change

          Row(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Icon(icon, color: color),
              const SizedBox(width: 5),

              Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  Text(formatNumber(num.parse(item.change_value!)), style: textTheme.headlineMedium?.copyWith(color: color)),  
                  Text("${formatChangePercent(num.parse(item.change_percent!))}%", style: textTheme.headlineMedium?.copyWith(color: color)),  

                ],

              )

            ],

          ),
    
        ],
    
      ),
    
    );
  }
}