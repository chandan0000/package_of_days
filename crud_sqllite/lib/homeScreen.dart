import 'dart:developer';

import 'package:crud_sqllite/db_handler.dart';
import 'package:crud_sqllite/notes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    dbHelper = DBHelper();
    loadData();
    super.initState();
  }

  loadData() async {
    notesList = await dbHelper.getNotesList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes SQl'),
        centerTitle: true,
      ),
      body: Scaffold(
        body: Column(
          children: [
            FutureBuilder(
                builder: ((context, AsyncSnapshot<List<NotesModel>> snapshot) {
              return ListView.builder(itemBuilder: (context, snapshot) {
                return Card(
                  child: ListTile(),
                );
              });
            }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper
              ?.insert(
                NotesModel(
                  title: 'first notes',
                  description: 'this is my first sql app',
                  age: 22,
                  email: 'kumarchandan41u@gmail.com',
                ),
              )
              .then((value) => log('inserted'))
              .onError((error, stackTrace) => log('error'.toString()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
