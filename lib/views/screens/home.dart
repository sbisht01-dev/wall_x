import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wall_x/controller/apiOperations.dart';
import 'package:wall_x/models/photosModel.dart';
import 'package:wall_x/views/screens/fullscreen.dart';
import 'package:wall_x/views/widgets/category.dart';
import 'package:wall_x/views/widgets/app_bar.dart';
import 'package:wall_x/views/widgets/search_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Category usedHeight = Category();
  List<PhotosModel>? trendingWallList = [];

  getTrendingWallpaper() async {
    trendingWallList = await APIoperations.getTrendingWallpapers();
    debugPrint('${trendingWallList?.length}');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTrendingWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 209, 145, 40),
          title: const CustomAppBar(),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Searchbar(context: context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: CategoryView.cHeight,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: ((context, index) => const CategoryView()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    (trendingWallList?.length ?? 0 / 5),
                // width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 300),
                    itemCount: trendingWallList?.length,
                    itemBuilder: (context, index) => GridTile(
                          child: InkWell(
                            onTap: () {
                              if (trendingWallList?.length != null &&
                                  trendingWallList!.length > index) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FullScreen(
                                            imgURL: trendingWallList![index]
                                                .imgSrc)));
                              }
                            },
                            child: Hero(
                              tag: 'trendingWallList[index].imgSrc',
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl: trendingWallList![index].imgSrc,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: const Color.fromARGB(
                                        255, 211, 211, 211),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
