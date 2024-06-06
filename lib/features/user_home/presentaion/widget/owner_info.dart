import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/data/services/get_user.dart';

class OwnerInfo extends StatefulWidget {
  const OwnerInfo({
    super.key,
    required this.userEntity,
    required this.projectModel,
  });
  final UserEntity userEntity;
  final ProjectModel projectModel;

  @override
  State<OwnerInfo> createState() => _OwnerInfoState();
}

class _OwnerInfoState extends State<OwnerInfo> {
  UserEntity userEntityy =
      UserEntity(userName: '', email: '', phone: '', coins: 0);
  @override
  void initState() {
    getUserInfo();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getUserInfo() async {
    userEntityy =
        await UserServices().getUserInfo(id: widget.projectModel.author!);
    setState(() {});
  }

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
              userEntityy.userName!,
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
