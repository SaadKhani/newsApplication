import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/pages/all_breaking_news.dart';
import 'package:news_app/pages/all_trending_news.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/pages/category_news.dart';
import 'package:news_app/pages/category&breaking_news_web_page.dart';
import 'package:news_app/sevices/data.dart';
import 'package:news_app/sevices/news.dart';
import 'package:news_app/sevices/slider_data.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/carousal_wideget.dart';
import 'package:news_app/widgets/category_tile_for_home_page.dart';
import 'package:news_app/widgets/page_slide_dotts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> slider = [];
  List<ArticleModel> trendingArticles = [];
  List<ArticleModel> breakingArticles = [];
  int activeIndex = 0;
  bool loading = true;

  getTrendingNews() async {
    News newsclass = News();
    await newsclass.getTrendingNews();
    trendingArticles = newsclass.trendingNews;
    setState(() {
      loading = false;
    });
  }

  getBreakingNews() async {
    News newsclass = News();
    await newsclass.getBreakingNews();
    breakingArticles = newsclass.breakingNews;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    categories = getcategories();
    slider = getsliders();
    getTrendingNews();
    getBreakingNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
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
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  spacing: 15,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => categoryNews(
                                    name: categories[index].categoryName!,
                                  ),
                                ),
                              );
                            },
                            child: Categorytileforhomepage(
                              image: categories[index].image,
                              CategoryName: categories[index].categoryName,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Breaking News',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AllBreakingNews(
                                    allbreakingArticles: breakingArticles,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'View all',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        final res = breakingArticles[index].urlToImage;
                        final res1 = breakingArticles[index].title;
                        return Container(
                          margin: EdgeInsets.all(6),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryAndBreakingNewsWebPage(
                                        blogUrl: breakingArticles[index].url!,
                                      ),
                                ),
                              );
                            },
                            child: CarousalWideget(
                              image: res,
                              index: index,
                              name: res1,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 250,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                    Dotts(activeindex: activeIndex, count: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Trending News',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => alltrendingNews(
                                    alltrendingArticles: trendingArticles,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'View all',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: trendingArticles.length,
                      itemBuilder: (BuildContext context, ind) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleView(
                                  blogUrl: trendingArticles[ind].url!,
                                ),
                              ),
                            );
                          },
                          child: BlogTile(
                            title: trendingArticles[ind].title!,
                            disc: trendingArticles[ind].description!,
                            imageUrl: trendingArticles[ind].urlToImage!,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
