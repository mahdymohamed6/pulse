import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';

class OwnerInfo extends StatelessWidget {
  const OwnerInfo({
    super.key,
    required this.userEntity,
  });
  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage('lib/assets/images/man.png'),
        ),
        const SizedBox(
          width: 17,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userEntity.userName!,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'dongel',
                color: Colors.black,
              ),
            ),
            const Text(
              'Owner',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'dongel',
                color: Color(0XFF6C6767),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
