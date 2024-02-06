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

  bool visibility = true;
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    getTrendingWallpaper();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        visibility = false;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: CachedNetworkImage(
                                      imageUrl: trendingWallList![index].imgSrc,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(
                                              strokeWidth: 2,
                                              strokeCap: StrokeCap.round),
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
          AnimatedOpacity(
            opacity: visibility ? 1.0 : 0.0,
            duration: const Duration(seconds: 2),
            child: Visibility(
              visible: isVisible,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: const Center(
                  child: Text(
                    'Wall_X',
                    style: TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
