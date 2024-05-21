import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/presentaion/all_description.dart';

class ProgectDescription extends StatelessWidget {
  const ProgectDescription({
    super.key,
    required this.progectModel,
    required this.userEntity,
  });
  final ProjectModel progectModel;
  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            progectModel.description!,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'dangrek',
              color: Color(0XFF403E3E),
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF17B861),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllDescription(
                                  progectModel: progectModel,
                                  userEntity: userEntity,
                                )),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'show more',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0XFFE6FDF0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
            // 'A well-prepared project plan not only serves as a roadmap for project execution but also brings about various advantages that contribute to a project’s all-',
