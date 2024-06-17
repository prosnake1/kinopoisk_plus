import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/features/film_page/widgets/widgets.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.infoList,
  });

  final FilmInfo infoList;

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
          child: Container(
        alignment: Alignment.topCenter,
        color: Colors.grey.shade200,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Text(
                    'Описание',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    infoList.description ?? 'Нет описания',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Год',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      infoList.year,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    (infoList.countries.length == 1) ? 'Страна' : 'Страны',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    child: buildCountriesTiles(infoList),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    ]);
  }
}
