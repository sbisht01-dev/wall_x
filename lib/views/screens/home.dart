import 'package:flutter/material.dart';
import 'package:wall_x/views/widgets/customAppBar.dart';
import 'package:wall_x/views/widgets/searchBar.dart';

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
      body: const Column(children: [Searchbar()]),
    );
  }
}
