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
  late List<PhotosModel> trendingWallList;

  GetTrendingWallpaper() async {
    trendingWallList = await APIoperations.getTrendingWallpapers();
    debugPrint('${trendingWallList.length}');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetTrendingWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 209, 145, 40),
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
                height: Category.cHeight,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: ((context, index) => const Category()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    (trendingWallList.length / 5),
                // width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 300),
                    itemCount: trendingWallList.length,
                    itemBuilder: (context, index) => GridTile(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullScreen(
                                          imgURL:
                                              trendingWallList[index].imgSrc)));
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: 400,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Image.network(
                                  trendingWallList[index].imgSrc,
                                  fit: BoxFit.cover,
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
