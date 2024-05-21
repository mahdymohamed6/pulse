import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    required this.progectModel,
  });
  final ProjectModel progectModel;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  // late VideoPlayerController videoPlayerController;
  // late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    //   videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
    //       'https://investpulse.onrender.com/${widget.progectModel.image!}'));
    //   chewieController = ChewieController(
    //     videoPlayerController: videoPlayerController,
    //     aspectRatio: 16 / 9,
    //     autoPlay: true,
    //     looping: true,
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              'video of the progect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 14, top: 12, bottom: 30),
            child: Text(
              'Schedule a call',
              style: TextStyle(
                fontSize: 20,
                color: Color(0XFF00C35A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   videoPlayerController.dispose();
  //   chewieController.dispose();
  //   super.dispose();
  // }
}
