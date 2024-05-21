import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/presentaion/project_info.dart';

class ProjectListViewItem extends StatelessWidget {
  const ProjectListViewItem({
    super.key,
    required this.projectModel,
    required this.userEntity,
  });
  final ProjectModel projectModel;
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188,
      width: 320,
      decoration: BoxDecoration(
          color: const Color(0XFFD9D9D9),
          borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 6,
          ),
          Text(
            projectModel.title!,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: 'dongel'),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            projectModel.description!,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: 'dongel'),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 220),
            child: Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF17B861),
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgectInfoView(
                                projectModel: projectModel,
                                userEntity: userEntity,
                              )),
                    );
                  },
                  child: const Text(
                    'More',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0XFFE6FDF0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
