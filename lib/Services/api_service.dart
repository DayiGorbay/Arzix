import 'package:arzix/Models/currency.dart';
import 'package:arzix/Models/crypto.dart';
import 'package:arzix/Models/gold.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';

List<Currency> currency = [];
List<Crypto> crypto = [];
List<Gold> gold = [];


Future getResponse() async {

  var url = Uri.parse('${dotenv.env['API_URL']}?key=${dotenv.env['API_KEY']}');
  final response = await http.get(url);

  if (response.statusCode == 200) {

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    List currencyList = jsonResponse["currency"];
    List cryptoList = jsonResponse["crypto"];
    List goldList = jsonResponse["gold"];
    // List jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);

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

    if (cryptoList.isNotEmpty) {

      crypto.clear();

      for (var item in cryptoList) {
                        
        crypto.add(

          Crypto(

            date: item['date'].toString(), 
            time: item['time'].toString(), 
            symbol: item['symbol'].toString(),
            name_en: item['name_en'].toString(), 
            name: item['name'].toString(), 
            price: item['price'].toString(), 
            change_value: item['change_value'].toString(), 
            change_percent: item['change_percent'].toString(), 
            unit: item['unit'].toString(),
            market_cap: item['market_cap'].toString(),
            description: item['description'].toString()

          )

        );

      }

    }

    if (goldList.isNotEmpty) {

      gold.clear();

      for (var item in goldList) {
                        
        gold.add(

          Gold(

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

  } else {
    print(response.statusCode);
  }

  print(response.statusCode);

  return response;

}