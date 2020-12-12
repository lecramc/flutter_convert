import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  SearchBar({@required this.onSearch}):super(key: Key("search_currency"));

  @override
  State<StatefulWidget> createState() => _SearchBarState(onSearch: onSearch);
}

class _SearchBarState extends State<SearchBar> {
  final Function(String) onSearch;
  TextEditingController _controller;

  _SearchBarState({@required this.onSearch});

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 10),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Search"),
          onSubmitted: (String value) {
            if(value == ""){
              print("RIEN");
            }
            onSearch(value);
            print("Valeur");
          },
        ));
  }
}
