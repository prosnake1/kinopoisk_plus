import 'package:flutter/material.dart';

class GalleryTitle extends StatelessWidget {
  const GalleryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          const SizedBox(
            width: 19,
          ),
          Text(
            'Галлерея',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
