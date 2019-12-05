import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'newsCard.dart';

class Tech extends StatefulWidget {
  @override
  _TechState createState() => _TechState();
}

class _TechState extends State<Tech> {
  List articles = [];
  final apiUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=fc47c3569df9477780b539cfd3a578a3";
  Future getData() async {
    http.Response response = await http.get(this.apiUrl);
    Map<String, dynamic> resbody = await json.decode(response.body);
    // print(resbody['articles'][0]['source']['name']);

    setState(() {
      articles = resbody['articles'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext cntx, int index) {
        return NewsCard(
            articles[index]['author'],
            articles[index]['title'],
            articles[index]['description'],
            articles[index]['urlToImage'],
            articles[index]['url']);
      },
    );
  }
}
