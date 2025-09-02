import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarousalWideget extends StatelessWidget {
  final String? image, name;
  final int? index;
  const CarousalWideget({super.key, this.image, this.index, this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(13),
          child: CachedNetworkImage(
            imageUrl: image!,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 160),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,

          child: Text(
            maxLines: 2,
            name!,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
