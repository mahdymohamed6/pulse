import 'package:flutter/material.dart';
import 'package:investify/constants.dart';
import 'package:investify/features/regester/presentaion/register_view.dart';

class RoleView extends StatelessWidget {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Are You',
            style: TextStyle(
                color: Colors.white, fontSize: 65, fontFamily: 'dangrek'),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                child: Container(
                  height: 61,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0XFFE6FDF0),
                  ),
                  child: const Center(
                    child: Text(
                      'User',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'dangrek',
                        color: Color(0xFF17B861),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'dangrek'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                child: Container(
                  height: 61,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0XFFE6FDF0),
                  ),
                  child: const Center(
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'dangrek',
                        color: Color(0xFF17B861),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
