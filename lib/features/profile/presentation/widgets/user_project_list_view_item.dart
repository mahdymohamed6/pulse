import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';

class UserProgectListViewItem extends StatefulWidget {
  const UserProgectListViewItem(
      {Key? key, required this.progectModel, required this.onDeleteProject})
      : super(key: key);
  final ProjectModel progectModel;
  final VoidCallback onDeleteProject;

  @override
  State<UserProgectListViewItem> createState() =>
      _UserProgectListViewItemState();
}

class _UserProgectListViewItemState extends State<UserProgectListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188,
      width: 320,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              widget.progectModel.title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'dongel',
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              widget.progectModel.description!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'dongel',
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 280),
              child: PopupMenuButton<String>(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 28,
                ),
                onSelected: (String value) {
                  if (value == 'Delete') {
                    widget.onDeleteProject();
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Delete',
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
