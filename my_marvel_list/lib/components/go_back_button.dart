import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(final BuildContext context) {
    if (ModalRoute.of(context)?.isFirst ?? false) {
      return Container();
    }
    return IconButton(
      onPressed: () => _goBack(context),
      icon: const Icon(
        Icons.chevron_left,
        size: 40,
      ),
    );
  }

  _goBack(final BuildContext context) {
    Navigator.of(context).pop();
  }
}
