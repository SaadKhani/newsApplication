import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class News {
  List<ArticleModel> trendingNews = [];
  List<ArticleModel> breakingNews = [];
  List<ArticleModel> categoryNews = [];

  Future<void> getTrendingNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2025-08-01&sortBy=publishedAt&apiKey=2f43a68141f4431a9cdbd342130aadae";
    var response = await http.get(Uri.parse(url));

    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],

            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          trendingNews.add(articleModel);
        }
      });
    }
  }

  Future<void> getBreakingNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2f43a68141f4431a9cdbd342130aadae";
    var response = await http.get(Uri.parse(url));

    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],

            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          breakingNews.add(articleModel);
        }
      });
    }
  }

  Future<void> getCategoryNews(String general) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$general&apiKey=2f43a68141f4431a9cdbd342130aadae";
    var response = await http.get(Uri.parse(url));

    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],

            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          categoryNews.add(articleModel);
        }
      });
    }
  }
}
