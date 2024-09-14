import 'package:flutter/material.dart';

class SingleDataCard extends StatelessWidget {
  final String name;
  final Icon icon;
  final dynamic data;
  const SingleDataCard(
      {super.key, required this.name, required this.icon, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          data.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
