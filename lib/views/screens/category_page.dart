import 'package:flutter/material.dart';
import 'package:wall_x/views/widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

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
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    "https://img.freepik.com/free-photo/mythical-dragon-beast-anime-style_23-2151112837.jpg?t=st=1706970317~exp=1706973917~hmac=2eb09054b5a41f5e433ee9e33d91148907562e1857b46a8b08fdebd2ef7c90cc&w=1380",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(18, 130, 130, 130)
                    ],
                  )),
                ),
                Positioned(
                  left: 16,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Anime",
                        style: GoogleFonts.balooPaaji2(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 52,
                        )),
                  ),
                )
              ],
            ),
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
