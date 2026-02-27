import 'package:flutter/material.dart';

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