import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/category&breaking_news_web_page.dart';
import 'package:news_app/sevices/news.dart';
import 'package:news_app/widgets/show_category.dart';

class categoryNews extends StatefulWidget {
  final String name;

  const categoryNews({super.key, required this.name});

  @override
  State<categoryNews> createState() => _categoryNewsState();
}

class _categoryNewsState extends State<categoryNews> {
  List<ArticleModel> categoryNews = [];
  bool loading = true;

  getCategoryNews() async {
    News newsclass = News();
    await newsclass.getCategoryNews(widget.name);
    categoryNews = newsclass.categoryNews;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCategoryNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
            Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < categoryNews.length; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryAndBreakingNewsWebPage(
                                  blogUrl: categoryNews[i].url!,
                                ),
                          ),
                        );
                      },
                      child: ShowCategory(
                        image: categoryNews[i].urlToImage!,
                        title: categoryNews[i].title!,
                        disc: categoryNews[i].description!,
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
