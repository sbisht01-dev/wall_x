import 'package:flutter/material.dart';
import 'package:wall_x/controller/apiOperations.dart';
import 'package:wall_x/models/photosModel.dart';
import 'package:wall_x/views/screens/fullscreen.dart';
import 'package:wall_x/views/widgets/app_bar.dart';
import 'package:wall_x/views/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key, required this.query});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotosModel> searchResults;
  GetsearchResults() async {
    searchResults = await APIoperations.searchWallpaper(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetsearchResults();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const CustomAppBar(),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Searchbar(context: context),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    (searchResults.length / 5),
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 300),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreen(
                                        imgURL: searchResults[index].imgSrc)));
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 246, 246, 246),
                              ),
                              child: Image.network(
                                searchResults[index].imgSrc,
                                fit: BoxFit.cover,
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
