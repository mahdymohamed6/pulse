import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:investify/features/profile/presentation/user_project_view.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/services/get_user.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String id = GetStorage().read('id');
  UserEntity userEntity =
      UserEntity(userName: '', email: '', phone: '', coins: 0);
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    userEntity = await UserServices().getUserInfo(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 241),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            const Text(
              'Profile',
              style: TextStyle(
                  color: Color(0XFF31A063), fontSize: 39, fontFamily: 'dongel'),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  userEntity.userName!,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 22, fontFamily: 'dongel'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  userEntity.email!,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 22, fontFamily: 'dongel'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  userEntity.phone!,
                  style: TextStyle(
                      color: Colors.black, fontSize: 22, fontFamily: 'dongel'),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Material(
              elevation: 8,
              shadowColor: const Color.fromARGB(255, 126, 125, 125),
              child: Container(
                height: 60,
                width: 200,
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
                            builder: (context) => const UserProgectView()),
                      );
                    },
                    child: const Text(
                      'Your Projects',
                      style: TextStyle(
                        fontSize: 26,
                        color: Color(0XFFE6FDF0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
