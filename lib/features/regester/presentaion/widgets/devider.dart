import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  const Devider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            height: 36,
            thickness: 1,
            indent: 12,
            endIndent: 12,
          ),
        ),
        Text(
          'contact us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            height: 36,
            thickness: 1,
            indent: 12,
            endIndent: 12,
          ),
        ),
      ],
    );
  }
}
