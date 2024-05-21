import 'package:flutter/material.dart';
import 'package:investify/constants.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';

class TotalProfit extends StatelessWidget {
  const TotalProfit({
    super.key,
    required this.userEntity,
  });
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127,
      width: 355,
      decoration: BoxDecoration(
          gradient: gradientColor2, borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 12,
          ),
          const Text(
            'your total profit portfolio',
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontFamily: 'dongel'),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            '${userEntity.coins.toString()} coins ',
            style: const TextStyle(
                color: Colors.white, fontSize: 32, fontFamily: 'dongel'),
          ),
        ]),
      ),
    );
  }
}
