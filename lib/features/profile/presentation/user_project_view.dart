import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:investify/features/control_page.dart';
import 'package:investify/features/profile/presentation/widgets/user_project_list_view_item.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/data/services/get_user.dart';
import 'package:investify/features/user_home/data/services/progects_services.dart';

class UserProgectView extends StatefulWidget {
  const UserProgectView({super.key});

  @override
  State<UserProgectView> createState() => _UserProgectViewState();
}

class _UserProgectViewState extends State<UserProgectView> {
  String id = GetStorage().read('id');
  UserEntity userEntity =
      UserEntity(userName: '', email: '', phone: '', coins: 0);
  List<ProjectModel> progectsList = [];

  @override
  void initState() {
    super.initState();
    getUserInfo();
    getAllProgects();
  }

  Future<void> getUserInfo() async {
    userEntity = await UserServices().getUserInfo(id: id);
    setState(() {});
  }

  Future<void> getAllProgects() async {
    progectsList = await ProjectsServices2().getUserProjects(id: id);
    setState(() {});
  }

  Future<void> deleteProject(String id) async {
    await ProjectsServices2().deletProjectById(id: id);
    progectsList.removeWhere((project) => project.id == id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ControlPage(
                  initialIndex: 2,
                ),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Welcome, ${userEntity.userName}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'dongel',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              if (progectsList.isEmpty)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Empty !',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          'lib/assets/images/empty.png',
                          scale: 1.2,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 50,
                          width: 200,
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
                                      builder: (context) => const ControlPage(
                                            initialIndex: 1,
                                          )),
                                );
                              },
                              child: const Center(
                                child: Text(
                                  'Add Project',
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
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: progectsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 22,
                          right: 22,
                          bottom: 16,
                        ),
                        child: UserProgectListViewItem(
                          progectModel: progectsList[index],
                          onDeleteProject: () =>
                              deleteProject(progectsList[index].id!),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
