import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 238, 238),
            border: Border.all(color: const Color.fromARGB(255, 135, 135, 135)),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search wallpaper",
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
