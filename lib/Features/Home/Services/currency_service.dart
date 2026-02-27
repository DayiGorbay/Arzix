import 'package:arzix/Models/Currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';

List<Currency> currency = [];


Future getResponse() async {

  var url = Uri.parse('${dotenv.env['API_URL']}?key=${dotenv.env['API_KEY']}');
  final response = await http.get(url);

  if (response.statusCode == 200) {

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    List currencyList = jsonResponse["currency"];
    // List jsonResponse = convert.jsonDecode(response.body);

    if (currencyList.isNotEmpty) {

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

    }

  }

  return response;

}