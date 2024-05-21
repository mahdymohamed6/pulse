import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/presentaion/project_info.dart';

class AllDescription extends StatelessWidget {
  const AllDescription(
      {super.key, required this.progectModel, required this.userEntity});
  final ProjectModel progectModel;
  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ProgectInfoView(
                        projectModel: progectModel,
                        userEntity: userEntity,
                      )),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ListView(children: [
          Text(
            progectModel.description!,
            style: const TextStyle(fontSize: 20, fontFamily: 'dongel'),
          ),
        ]),
      ),
    );
  }
}
