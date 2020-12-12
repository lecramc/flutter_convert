import 'package:flutter_convert/domain/currency.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class CurrencyAPI {
  final String baseUrl = "https://currency26.p.rapidapi.com";

  Future<List<Currency>> getListCur() async {
    var headers = Map<String, String>();
    List<Currency> currencyList = [];

    headers['x-rapidapi-key'] = "2836201e3bmshc07018c323dc6e1p143fffjsn2e4b0da5eef5";
    headers['x-rapidapi-host'] = "currency26.p.rapidapi.com";
    String myurl = "$baseUrl/list";
    var res = await http.get(myurl,headers:headers);
    var resDecode = jsonDecode(res.body);

    resDecode.forEach((key, value) => {
      currencyList.add(new Currency(key, value)),
    });
    print(currencyList);
    return currencyList;
  }
  Future<List<Currency>> getConversion() async{
    var headers = Map<String, String>();
    List<Currency> currencyList = [];

    headers['x-rapidapi-key'] = "2836201e3bmshc07018c323dc6e1p143fffjsn2e4b0da5eef5";
    headers['x-rapidapi-host'] = "currency26.p.rapidapi.com";
    String myurl = "$baseUrl/convert";
    var res = await http.get(myurl,headers:headers);
    var resDecode = jsonDecode(res.body);

    resDecode.forEach((key, value) => {
      currencyList.add(new Currency(key, value)),
    });
    print(currencyList);
    return currencyList;
  }
}