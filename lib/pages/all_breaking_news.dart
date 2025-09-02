import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/widgets/blog_tile.dart';

class AllBreakingNews extends StatelessWidget {
  final List<ArticleModel> allbreakingArticles;
  const AllBreakingNews({super.key, required this.allbreakingArticles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BreakingNews',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: allbreakingArticles.length,
        itemBuilder: (BuildContext context, ind) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ArticleView(blogUrl: allbreakingArticles[ind].url!),
                ),
              );
            },
            child: BlogTile(
              title: allbreakingArticles[ind].title!,
              disc: allbreakingArticles[ind].description!,
              imageUrl: allbreakingArticles[ind].urlToImage!,
            ),
          );
        },
      ),
    );
  }
}
