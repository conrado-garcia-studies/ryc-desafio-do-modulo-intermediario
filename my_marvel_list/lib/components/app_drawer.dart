import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_marvel_list/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(final BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 50,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            IconData(
              0xf3e7,
              fontFamily: CupertinoIcons.iconFont,
              fontPackage: CupertinoIcons.iconFontPackage,
            ),
          ),
          title: const Text('All Comic Series'),
          onTap: () => Navigator.of(context).popUntil(
            (route) {
              final String? name = route.settings.name;
              return name != null && name.endsWith('series-selection');
            },
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            IconData(
              0xf6e8,
              fontFamily: CupertinoIcons.iconFont,
              fontPackage: CupertinoIcons.iconFontPackage,
            ),
          ),
          title: const Text('My List'),
          onTap: () => Navigator.pushNamed(context, AppRoutes.myList),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            IconData(
              0xf44c,
              fontFamily: CupertinoIcons.iconFont,
              fontPackage: CupertinoIcons.iconFontPackage,
            ),
          ),
          title: const Text('About'),
          onTap: () => Navigator.pushNamed(context, AppRoutes.about),
        ),
      ]),
    );
  }
}
