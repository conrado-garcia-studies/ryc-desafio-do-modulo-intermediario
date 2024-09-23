import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_marvel_list/utils/app_routes.dart';

class MyListButton extends StatelessWidget {
  const MyListButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton(
      tooltip: 'My List',
      onPressed: () => Navigator.pushNamed(context, AppRoutes.myList),
      child: const Icon(
        IconData(
          0xf6e8,
          fontFamily: CupertinoIcons.iconFont,
          fontPackage: CupertinoIcons.iconFontPackage,
        ),
      ),
    );
  }
}
