import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  String imgURL;
  FullScreen({super.key, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'trendingWallList[index].imgSrc',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgURL), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
