import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_marvel_list/screens/series_selection_screen.dart';
import 'package:my_marvel_list/stores/series_selection_store.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    required this.store,
  });

  final SeriesSelectionStore store;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isShowClearButton = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return SearchBar(
      controller: _textEditingController,
      focusNode: _focusNode,
      hintText: 'Start of the title (e.g. Ave).',
      trailing: <Widget>[
        if (_isShowClearButton)
          IconButton(
            onPressed: () {
              _textEditingController.clear();
            },
            icon: const Icon(
              IconData(
                0xf404,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage,
              ),
            ),
          ),
        IconButton(
          onPressed: () => _onSubmitted(context),
          icon: const Icon(
            IconData(
              0xf4a5,
              fontFamily: CupertinoIcons.iconFont,
              fontPackage: CupertinoIcons.iconFontPackage,
            ),
          ),
        )
      ],
      onChanged: _onChanged,
      onSubmitted: (_) => _onSubmitted(context),
      constraints: const BoxConstraints(
        maxHeight: 40,
      ),
      textInputAction: TextInputAction.go,
    );
  }

  void _onSubmitted(final BuildContext context) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    final String text = _textEditingController.text.trim();
    _textEditingController.clear();
    widget.store.hideSearchBar();
    if (text.isEmpty) {
      return;
    }
    const String routeName = '/searched-series-selection-screen';
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SeriesSelectionScreen(
          title: 'Search result for "$text"',
          routeName: routeName,
          specificQueryParameters: <String, dynamic>{
            'titleStartsWith': text,
          },
        ),
        settings: const RouteSettings(
          name: routeName,
        ),
      ),
    );
  }

  void _onChanged(final String? value) {
    setState(() => _isShowClearButton = value?.trim().isNotEmpty ?? false);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
