import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:arzix/Services/api_service.dart';
import 'package:arzix/Features/Pages/Crypto/crypto_item.dart';
import 'package:arzix/Features/Widgets/ad_container.dart';
import 'package:arzix/Core/Widgets/infobox.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  late Future responseFuture;

  @override
  void initState() {
    super.initState();
    responseFuture = getResponse();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // return  SingleChildScrollView CryptoPage(TextTheme textTheme, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,10,20,0),
        child: Column(
          children: [

            // QA

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  
                Image.asset("assets/images/information.png", width: 28, height: 28),
                const SizedBox(width: 5,),
                Text("رمز ارز (کریپتو) چیست؟", style: textTheme.bodyLarge),
      
              ],
      
            ),
      
            const SizedBox(height: 5),
      
            Text(
              """رمز ارز نوعی پول دیجیتال است که بر پایه بلاک‌چین کار می‌کند و بدون نیاز به بانک یا دولت مرکزی بین کاربران معامله می‌شود. این ارزها امنیت بالا و تراکنش سریع دارند. قیمت آن‌ها بر اساس عرضه و تقاضا در بازار مشخص می‌شود.""",
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
                        Text("نام رمز ارز", style: textTheme.headlineLarge),

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
              height: MediaQuery.of(context).size.height/1.98,
              // decoration: BoxDecoration(

              //   borderRadius: const BorderRadius.all(Radius.circular(10)),
              //   // color: Color.fromARGB(255, 226, 226, 226),
                
              // ),

              // physics: const BouncingScrollPhysics(), 
              child: FutureBuilder(

                builder: (context, snapshot) {
                  return snapshot.hasData 

                    ? 
                    
                    ListView.separated(physics: const BouncingScrollPhysics(), itemCount: crypto.length, itemBuilder: (BuildContext context, int position){
                
                      return Padding(
                    
                        padding: const EdgeInsets.fromLTRB(0,15,0,0),
                        child: CryptoItemWidget(item: crypto[position]),
                    
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
                    
                    
                    },) 

                    : 
                    
                  const Center(child: CircularProgressIndicator());

                },

                future: responseFuture,

              ),

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

                  onPressed: () {

                    setState(() {
                      responseFuture = getResponse();
                    });
                    showInfoBox(context, SnackType.success, message: 'عملیات با موفقیت انجام شد');

                  },
                  icon: const Icon(CupertinoIcons.refresh_bold, color: Colors.white,), 
                  label: Text("بروزرسانی لیست ارز", style: textTheme.headlineLarge),
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 166, 71, 255))),
                  
                ),
              
              ),

            )

          ],
      
        ),
      
      ),

    );
  }
  // }
}