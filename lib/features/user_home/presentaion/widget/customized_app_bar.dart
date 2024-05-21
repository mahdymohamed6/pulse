import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/services/progects_services.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    title: const Text(
      'PULES',
      style: TextStyle(fontFamily: 'dangrek', color: Color(0XFF0F744F)),
    ),
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
        onPressed: () {
          ProjectsServices2().getAllProjects();
        },
        icon: const Icon(
          Icons.menu,
          color: Colors.grey,
        )),
  );
}
// import 'package:flutter/material.dart';

// PreferredSizeWidget customAppBar(Widget title, List<Widget> action) {
//   return AppBar(
//       scrolledUnderElevation: 0,
//       elevation: 0,
//       centerTitle: true,
//       backgroundColor: Colors.white,
//       leading: IconButton(
//           onPressed: () {
//             // BlocProvider.of<ChildCubit>(context).getUserData();
//           },
//           icon:const Icon(
//             Icons.menu,
//             color: Colors.grey,
//           )),
//       title: title,
//       actions: action);
// }
