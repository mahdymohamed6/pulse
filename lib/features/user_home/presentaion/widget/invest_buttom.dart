import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/presentaion/invest_view.dart';

class InvestButtom extends StatelessWidget {
  const InvestButtom({
    super.key,
    required this.progectModel,
    required this.userEntity,
  });
  final ProjectModel progectModel;
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 120,
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
                      builder: (context) => InvestView(
                            progectModel: progectModel,
                          )),
                );
              },
              child: const Center(
                child: Text(
                  'invest now',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
