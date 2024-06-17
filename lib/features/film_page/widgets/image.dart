import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.infoList,
    required this.imageUrl,
  });

  final FilmInfo infoList;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          (infoList.coverUrl == null)
              ? const SizedBox()
              : Image.network(
                  infoList.coverUrl ?? '',
                  height: 300,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.3),
                ),
          SizedBox(
            child: Image.network(
              imageUrl,
              height: 240,
              width: 180,
            ),
          ),
        ],
      ),
    );
  }
}
