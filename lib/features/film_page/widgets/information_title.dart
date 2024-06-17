import 'package:flutter/material.dart';

class InformationTitle extends StatelessWidget {
  const InformationTitle({
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
            'Информация',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
