import 'package:flutter/material.dart';
import 'package:wall_x/views/widgets/customeAppBar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: CustomAppBar(),
      ),
    );
  }
}
