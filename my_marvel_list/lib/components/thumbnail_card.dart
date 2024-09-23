import 'package:flutter/material.dart';

class ThumbnailCard extends StatelessWidget {
  final int? id;
  final String thumbnailUrl;
  final String title;
  final String? tooltipMessage;
  final Function()? onTap;

  const ThumbnailCard({
    super.key,
    this.id,
    required this.thumbnailUrl,
    required this.title,
    this.tooltipMessage,
    this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Tooltip(
        message: tooltipMessage,
        child: GridTile(
          child: Column(
            children: <Widget>[
              Builder(
                builder: (final BuildContext context) {
                  if (id == null) {
                    return _buildImageContainer(context);
                  }
                  return Hero(
                    tag: id!,
                    child: _buildImageContainer(context),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      title.trim(),
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildImageContainer(final BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        image: DecorationImage(
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: isPortrait ? 100 : 130,
    );
  }
}
