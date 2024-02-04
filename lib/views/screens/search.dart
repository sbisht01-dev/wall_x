import 'package:flutter/material.dart';
import 'package:wall_x/views/widgets/app_bar.dart';
import 'package:wall_x/views/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
            const Searchbar(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 300),
                    itemCount: 16,
                    itemBuilder: (context, index) => ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 230, 172, 47),
                            ),
                            child: Image.network(
                              "https://w0.peakpx.com/wallpaper/736/818/HD-wallpaper-demon-slayer-anime-sword.jpg",
                              fit: BoxFit.cover,
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