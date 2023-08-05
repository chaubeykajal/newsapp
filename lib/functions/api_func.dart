


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/model.dart';

List <Article> articles=[];



Future<void> fetchArticles() async {
    // final apiKey = 'f254be3fcce040aeb0a8c561a6c32dd3';
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=26965304c1ae4cac9ceede9008818c8e"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        articles = (jsonData['articles'] as List)
            .map((data) => Article.fromJson(data))
            .toList();
      });
    } else {
      throw Exception('Failed to load articles');
    }
  
}

void setState(Null Function() param0) {
}