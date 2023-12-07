import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisar no github"),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(right: 8, left: 8, top: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Pesquisar..."),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (_, id) {
              return const ListTile();
            }),
          )
        ],
      ),
    );
  }
}
