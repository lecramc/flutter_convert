import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_convert/config/currency_api.dart';
import 'package:flutter_convert/domain/currency.dart';
import 'package:flutter_convert/presentation/list.dart';
import 'package:flutter_convert/presentation/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Currency Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String searchInput = "";

  List<Currency> items;
  var cur = new CurrencyAPI();

  @override
  void initState() {
    super.initState();
    items = List<Currency>();
    cur.getListCur().then((result){
      setState(() {
        items = result;
      });
    }).catchError((error) => {
      print(error),
    });
  }


  void _buttonChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchBar(
            onSearch:(String value) {
              setState(() {
                searchInput = value;
                if(value != ""){
                items = items.where((element) => element.alias.contains(value) || element.label.contains(value)).toList();
                  print(items.where((element) => element.alias.contains(value) || element.label.contains(value)).length);
                  print(items);
                }

              });
            }
          ),
          Text(searchInput),
          Expanded(child: ListCurrency(currencyList: items)),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
        currentIndex: _currentIndex,
        onTap: _buttonChange,
      ),
    );
  }
}
