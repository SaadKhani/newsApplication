import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/widgets/blog_tile.dart';

class alltrendingNews extends StatelessWidget {
  final List<ArticleModel> alltrendingArticles;
  const alltrendingNews({super.key, required this.alltrendingArticles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TrendingNews',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: alltrendingArticles.length,
        itemBuilder: (BuildContext context, ind) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ArticleView(blogUrl: alltrendingArticles[ind].url!),
                ),
              );
            },
            child: BlogTile(
              title: alltrendingArticles[ind].title!,
              disc: alltrendingArticles[ind].description!,
              imageUrl: alltrendingArticles[ind].urlToImage!,
            ),
          );
        },
      ),
    );
  }
}
