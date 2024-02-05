import 'package:flutter/material.dart';
import 'package:wall_x/views/screens/search.dart';

class Searchbar extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();
  final BuildContext context;
  Searchbar({required this.context, Key? key}) : super(key: key);
  void onSubmit(String query) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchScreen(query: _searchController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 238, 238),
            border: Border.all(color: const Color.fromARGB(255, 135, 135, 135)),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (query) => onSubmit(query),
                controller: _searchController,
                decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 168, 168, 168)),
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none),
              ),
            ),
            InkWell(
              onTap: () {
                debugPrint("Searching...");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(query: _searchController.text)));
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Icon(Icons.search),
              ),
            )
          ],
        ),
      ),
    );
  }
}
