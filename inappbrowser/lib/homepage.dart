import 'package:flutter/material.dart';

import 'inappbrowserpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InApp Browser'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InAppBrowserPage()),
              );
            
            },
            child: Center(
              child: Text("Open Website"),
            )),
      ),
    );
  }
}
