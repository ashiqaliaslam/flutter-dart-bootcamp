// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer' show log;

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'PKR',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '2665C961-861E-4251-BA67-DB441FF599ED';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestUrl =
          '$coinApiUrl/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);

        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        log(response.statusCode.toString());
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}


/// Raw URL
/// `https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=2665C961-861E-4251-BA67-DB441FF599ED`
/// 
/// JSON Output
/// ```md
/// {
/// "time": "2024-09-15T15:25:04.0000000Z",
/// "asset_id_base": "BTC",
/// "asset_id_quote": "USD",
/// "rate": 60225.281039239366
/// }

