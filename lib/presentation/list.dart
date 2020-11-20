import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_convert/domain/currency.dart';


class ListCurrency extends StatefulWidget {
  final List<Currency> currencyList;

  ListCurrency({@required this.currencyList}):super(key: Key("list_${Random().nextInt(255)}"));

  @override
  State<StatefulWidget> createState() => _ListCurrencyState(currencyList: currencyList);

}
class _ListCurrencyState extends State<ListCurrency> {
  final List<Currency> currencyList;

  _ListCurrencyState({ @required this.currencyList});

  @override
  Widget build(BuildContext context) {
    print("list ${currencyList.length}");
    return Container(
      child: ListView.builder(
        itemCount: currencyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            key: Key("list_$index"),
            title: Text(currencyList[index].alias),
            subtitle: Text(currencyList[index].label),
            trailing: Container(
              width: 100,
              child: TextField(
              keyboardType: TextInputType.number,
              ),
            )
          );
        },
      )
    );
  }
}