import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'price_screen.dart';
import 'dart:convert';
String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=BD34DB4A-707D-4883-A663-6FAAD03F791C';




PriceScreen priceScreen = PriceScreen();
String selectedCurrency = priceScreen.sentCurrency();
class Networking{

  double rate;


Future getExchangeRates() async {
    http.Response response = await http.get(Uri.parse(url));
    String data = response.body;
    double rate = jsonDecode(data)['rate'];
   // double rate = decodedData['rate'];
    print(rate);
    print(response.statusCode);
    return rate;

  }



  }

