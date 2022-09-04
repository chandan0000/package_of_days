import 'package:flutter/material.dart';
import 'dart:async';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> _data = [];
  List<String> _filteredData = [];
  final _searchQueary = new TextEditingController();
  Timer? _debounce;
  String searchText = "";

  @override
  void initState() {
    _data.add('India');
    _data.add('India1');
    _data.add('India2');
    _data.add('India3');
    _data.add('India4');
    _data.add('India5');
    _data.add('India6');
    _data.add('India7');
    _data.add('India8');
    _data.add('India9');
    _data.add('India10');
    _data.add('India11');
    _data.add('India12');
    _data.add('India13');
    _filteredData = this._data;
    _searchQueary.addListener(() {
      _onSearchChanged();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debouncing search'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchQueary,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.greenAccent,
                  width: 1.0,
                )),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 1.0,
                  ),
                ),
                hintText: 'Search here',
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _filteredData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      _filteredData[index].toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                },
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        if (this.searchText != _searchQueary.text) {
          _filteredData = this._data;
          setState(() {
            this
                ._filteredData
                .where((item) => item.toString().toLowerCase().contains(
                      _searchQueary.text.toString().toLowerCase(),
                    ))
                .toList();
          });
        }
        this.searchText = _searchQueary.text;
      },
    );
  }

  @override
  void dispose() {
    _searchQueary.removeListener(_onSearchChanged);
    _searchQueary.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
