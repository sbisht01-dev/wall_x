import 'package:flutter/material.dart';
import 'package:wall_x/views/widgets/category.dart';
import 'package:wall_x/views/widgets/app_bar.dart';
import 'package:wall_x/views/widgets/search_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const CustomAppBar(),
      ),
      body: Column(children: [
        const Searchbar(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: Category.cHeight,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) => Category()),
            ),
          ),
        )
      ]),
    );
  }
}
