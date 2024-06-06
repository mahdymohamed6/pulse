import 'package:flutter/material.dart';
import 'package:investify/features/control_page.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';

class ProjectImageInfo extends StatelessWidget {
  const ProjectImageInfo({
    super.key,
    required this.progectModel,
  });
  final ProjectModel progectModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(
              progectModel.image!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            // child: Image.asset('lib/assets/images/Rectangle 68.png'),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 25),
              child: Container(
                height: 35,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF17B861),
                ),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ControlPage(
                                initialIndex: 0,
                              )),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            const SizedBox(
              height: 58,
            ),
            Padding(
              padding: EdgeInsets.only(left: 39),
              child: Text(
                progectModel.title!,
                style: const TextStyle(
                    color: Colors.white, fontSize: 26, fontFamily: 'dongel'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
