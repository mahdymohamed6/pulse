import 'package:flutter/material.dart';
import 'package:investify/constants.dart';
import 'package:investify/features/regester/presentaion/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    const Duration splashDuration = Duration(seconds: 3);

    // Navigates to the next page
    void navigateToNextPage() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    }

    // Delayed navigation to the next page
    Future<void>.delayed(splashDuration, navigateToNextPage);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradientColor,
        ),
        child: Column(children: [
          const SizedBox(
            height: 200,
          ),
          Container(
            height: 330,
            width: 330,
            child: Image.asset(
              'lib/assets/images/logo2.png',
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'WE',
          //       style: TextStyle(
          //           color: Colors.white, fontSize: 65, fontFamily: 'dangrek'),
          //     ),
          //     Text(
          //       'LCOME',
          //       style: TextStyle(
          //           color: Colors.white, fontSize: 65, fontFamily: 'dangrek'),
          //     )
          //   ],
          // )
        ]),
      ),
    );
  }
}
// Color.lerp(const Color(0XFF17B861), const Color(0xFF0A522C),0.5)
