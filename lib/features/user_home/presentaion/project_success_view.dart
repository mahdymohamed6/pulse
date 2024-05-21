import 'package:flutter/material.dart';
import 'package:investify/features/control_page.dart';

class ProjectSuccess extends StatelessWidget {
  const ProjectSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 241),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.check_circle,
                color: Color(0XFF00C35A),
                size: 230,
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Congrats!',
                style: TextStyle(color: Color(0XFF00C35A), fontSize: 55),
              ),
              const Text(
                'Your investment was successful',
                style: TextStyle(color: Color(0XFF777474), fontSize: 16),
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                height: 60,
                width: 150,
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
                                  initialIndex: 0,
                                )),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Great',
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
        ],
      ),
    );
  }
}
