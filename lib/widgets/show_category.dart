import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowCategory extends StatelessWidget {
  final String image, title, disc;
  const ShowCategory({
    super.key,
    required this.disc,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(disc),
          ],
        ),
      ),
    );
  }
}
