import 'package:flutter/material.dart';
import 'package:investify/features/add_project/presentatin/add_project.dart';
import 'package:investify/features/payment/persentaion/payment_view.dart';
import 'package:investify/features/profile/presentation/profile_view.dart';
import 'package:investify/features/user_home/presentaion/user_home.dart';

class ControlPage extends StatefulWidget {
  final int initialIndex; // New parameter

  const ControlPage({Key? key, this.initialIndex = 0})
      : super(key: key); // Updated constructor

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int selectedIndex = 0;
  static List<Widget> screens = [
    const UserHome(),
    const AddProgectView(),
    const ProfileView(),
    const PaymentView(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedIndex =
        widget.initialIndex; // Set initial index from the constructor
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: Color(0XFF00C35A),
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color(0XFF00C35A),
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? const Icon(
                    Icons.home,
                    color: Color(0XFF00C35A),
                  )
                : const Icon(
                    Icons.home,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? const Icon(
                    Icons.add,
                    color: Color(0XFF00C35A),
                  )
                : const Icon(
                    Icons.add,
                  ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? const Icon(
                    Icons.person,
                    color: Color(0XFF00C35A),
                  )
                : const Icon(
                    Icons.person,
                  ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? const Icon(
                    Icons.attach_money_outlined,
                    color: Color(0XFF00C35A),
                  )
                : const Icon(
                    Icons.attach_money_outlined,
                  ),
            label: 'payment',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Color(0XFF00C35A),
        onTap: onItemTapped,
      ),
    );
  }
}
