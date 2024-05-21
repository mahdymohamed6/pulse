import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/data/services/get_user.dart';
import 'package:investify/features/user_home/presentaion/widget/invest_buttom.dart';
import 'package:investify/features/user_home/presentaion/widget/owner_info.dart';
import 'package:investify/features/user_home/presentaion/widget/project_description.dart';
import 'package:investify/features/user_home/presentaion/widget/project_image_info.dart';
import 'package:investify/features/user_home/presentaion/widget/video_widget.dart';

class ProgectInfoView extends StatefulWidget {
  const ProgectInfoView(
      {super.key, required this.projectModel, required this.userEntity});
  final ProjectModel projectModel;
  final UserEntity userEntity;
  @override
  State<ProgectInfoView> createState() => _ProgectInfoViewState();
}

// late VideoPlayerController videoPlayerController;

UserEntity userEntity =
    UserEntity(userName: '', email: '', phone: '', coins: 0);

class _ProgectInfoViewState extends State<ProgectInfoView> {
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    userEntity =
        await UserServices().getUserInfo(id: widget.projectModel.author!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ProjectImageInfo(
              progectModel: widget.projectModel,
            ),
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 26),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'dongel',
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF258B66),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ProgectDescription(
              progectModel: widget.projectModel,
              userEntity: widget.userEntity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OwnerInfo(
                userEntity: userEntity,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Price : ${widget.projectModel.price.toString()}',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'dongel',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            InvestButtom(
              progectModel: widget.projectModel,
              userEntity: widget.userEntity,
            ),
            const SizedBox(
              height: 28,
            ),
            VideoWidget(
              progectModel: widget.projectModel,
            )
          ],
        ),
      ),
    );
  }
}
