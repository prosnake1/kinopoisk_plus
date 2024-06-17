import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';

Row buildTitle(FilmInfo infoList, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        child: Center(
          child: Text(
            infoList.nameRu ?? infoList.nameOriginal,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      (infoList.ratingKinopoisk == null)
          ? const SizedBox()
          : Card(
              color: Colors.lightGreenAccent,
              child: SizedBox(
                width: 25,
                height: 25,
                child: Center(
                  child: Text(infoList.ratingKinopoisk.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w900, color: Colors.white)),
                ),
              ),
            ),
    ],
  );
}
