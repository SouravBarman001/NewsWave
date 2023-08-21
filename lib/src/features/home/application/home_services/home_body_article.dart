import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../domain/banner_article_model.dart';

class BodyApiServices{

  Future<List<Article>> fetchBodyArticles() async {
    const apiKey = 'c06bf8b6442040cbbc97fc55ae987ee8';
    const apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';
    //const apiUrl = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> articlesJson = jsonData['articles'];
      print(articlesJson);
      final List<Article> articles = articlesJson.map((articleJson) {
        return Article.fromJson(articleJson);
      }).toList();
      print('data comes from api');
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}

final homeBodyProvider = Provider<BodyApiServices>((ref)=> BodyApiServices());