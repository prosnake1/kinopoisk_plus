import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/search');
                },
                child: const Text('Перейти к поиску фильмов',
                    style: TextStyle(
                      color: Colors.black,
                    )))),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
            child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/collection');
          },
          child: const Text(
            'Перейти в Мою Коллекцию',
            style: TextStyle(color: Colors.black),
          ),
        )),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
