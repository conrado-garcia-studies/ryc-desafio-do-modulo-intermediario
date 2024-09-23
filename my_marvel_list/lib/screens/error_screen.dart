import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:my_marvel_list/components/app_drawer.dart';
import 'package:my_marvel_list/components/go_back_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.message,
    this.tryAgain,
  });

  final String? message;
  final Function()? tryAgain;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: const <Widget>[
              GoBackButton(),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'assets/images/error.webp',
                    fit: BoxFit.fitWidth,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(0, 1),
                        end: const Alignment(0, 0),
                        colors: <Color>[
                          Theme.of(context).colorScheme.surface,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.black26,
            expandedHeight: 208,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(<Widget>[
              Bubble(
                nip: BubbleNip.leftTop,
                nipWidth: 30,
                nipHeight: 10,
                nipOffset: 15,
                color: Theme.of(context).colorScheme.inversePrimary,
                padding: const BubbleEdges.all(20),
                margin: const BubbleEdges.only(
                  top: 30,
                  bottom: 10,
                ),
                alignment: Alignment.topLeft,
                child: Text(message ?? 'Something went wrong.'),
              ),
              Bubble(
                nip: BubbleNip.rightTop,
                nipWidth: 30,
                nipHeight: 10,
                nipOffset: 15,
                color: Theme.of(context).colorScheme.inversePrimary,
                padding: const BubbleEdges.all(20),
                margin: const BubbleEdges.only(
                  top: 20,
                  bottom: 10,
                ),
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: tryAgain,
                  child: Text(
                    'Try again.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}
