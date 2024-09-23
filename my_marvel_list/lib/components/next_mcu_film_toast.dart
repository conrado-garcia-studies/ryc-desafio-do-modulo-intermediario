import 'package:flutter/material.dart';

class NextMcuFilmToast extends StatelessWidget {
  const NextMcuFilmToast({
    super.key,
    required this.body,
  });

  final Map<String, dynamic> body;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        image: DecorationImage(
          image: NetworkImage(body['poster_url']),
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.4),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'SAVE THE DATE',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'There are',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: ' ${body['days_until']} days left ',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(
                    text: 'for: ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: '${body['title']}',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(
                    text: '!',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const TextSpan(
                    text: '\n\nOnly in theaters.',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
