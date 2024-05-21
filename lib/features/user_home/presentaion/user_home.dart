import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/data/services/get_user.dart';
import 'package:investify/features/user_home/data/services/progects_services.dart';
import 'package:investify/features/user_home/presentaion/widget/customized_app_bar.dart';
import 'package:investify/features/user_home/presentaion/widget/project_list_view_item.dart';
import 'package:investify/features/user_home/presentaion/widget/total_profit.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String id = GetStorage().read('id');
  UserEntity userEntity =
      UserEntity(userName: '', email: '', phone: '', coins: 0);
  List<ProjectModel> progectsList = [];
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
    progectsList = await ProjectsServices2().getAllProjects();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 241),
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Text(
                    "Welcome, ${userEntity.userName!}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'dongel'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TotalProfit(
                    userEntity: userEntity,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: progectsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 22, right: 22, bottom: 16),
                      child: ProjectListViewItem(
                        projectModel: progectsList[index],
                        userEntity: userEntity,
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
