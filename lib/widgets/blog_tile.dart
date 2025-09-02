import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class BlogTile extends StatelessWidget {
  String imageUrl, title, disc;
  BlogTile({
    super.key,
    required this.disc,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      elevation: 5,
      surfaceTintColor: Colors.cyanAccent,

      child: Container(
        margin: EdgeInsets.all(2),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(13),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Image(image: AssetImage('images/Emptyimages.jpeg'));
                  },
                  imageUrl: imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                    Text(
                      disc,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                        color: Colors.black38,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
