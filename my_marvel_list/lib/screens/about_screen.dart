import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:my_marvel_list/components/go_back_button.dart';
import 'package:my_marvel_list/utils/text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        actions: const <Widget>[
          GoBackButton(),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              _createHeader('Contacts', TextStyles.h1),
              const BulletedList(
                listItems: <String>[
                  'conrado.garcia.studies@gmail.com',
                ],
                listOrder: ListOrder.unordered,
              ),
              _createHeader(
                'Credits',
                TextStyles.h1,
              ),
              _createHeader(
                'APIs',
                TextStyles.h2,
              ),
              BulletedList(
                listItems: <String>[
                  <String>[
                    'Marvel Comics API to fetch information about comic',
                    'series and characters.',
                    '"When is the next MCU film?" API by Diljot Garcha for',
                    'toast that is shown after the splash screen.',
                  ].join(' '),
                ],
                listOrder: ListOrder.unordered,
              ),
              _createHeader(
                'Fonts',
                TextStyles.h2,
              ),
              BulletedList(
                listItems: <String>[
                  <String>[
                    'Poppins font desined by Indian Type Foundry, Jonny',
                    'Pinhorn and Ninad Kale.',
                  ].join(' '),
                  <String>[
                    'Hall of Heroes font, used for character symbols, by',
                    'Iconian Fonts.',
                  ].join(' '),
                ],
                listOrder: ListOrder.unordered,
              ),
              _createHeader(
                'Lottie Animations',
                TextStyles.h2,
              ),
              BulletedList(
                listItems: <String>[
                  <String>[
                    '"Free loading Animation" by vinay kurve, configured in',
                    'purple to represent Thanos\' hand.',
                  ].join(' '),
                  <String>[
                    '"Free Splash Updated Colors Animation" by SameedShafi,',
                    'edited to show this app\'s logo.',
                  ].join(' '),
                ],
                listOrder: ListOrder.unordered,
              ),
              _createHeader(
                'Concept',
                TextStyles.h2,
              ),
              BulletedList(
                listItems: <String>[
                  <String>[
                    'Exercise proposal by RYC Team. The exercise proposes',
                    'using the Marvel Comics API to display information',
                    'about comic series and characters and using MobX for',
                    'state management. It also encourages practicing the use',
                    'of animations and slivers.',
                  ].join(' '),
                  <String>[
                    'This app was inspired by the MyDramaList app for the',
                    'logo and the idea of ​​creating lists organized by',
                    'status.',
                  ].join(' '),
                ],
                listOrder: ListOrder.unordered,
              ),
              _createHeader('Author', TextStyles.h1),
              const BulletedList(
                listItems: <String>[
                  'Conrado Garcia (conrado-garcia-studies)',
                ],
                listOrder: ListOrder.unordered,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _createHeader(final String text, final TextStyle style) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
