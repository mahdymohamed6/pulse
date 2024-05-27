import 'package:flutter/material.dart';
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/project_model.dart';
import 'package:investify/features/user_home/data/services/progects_services.dart';
import 'package:investify/features/user_home/presentaion/project_info.dart';
import 'package:investify/features/user_home/presentaion/project_success_view.dart';

class InvestView extends StatefulWidget {
  const InvestView(
      {super.key, required this.progectModel, required this.userEntity});
  final ProjectModel progectModel;
  final UserEntity userEntity;

  @override
  State<InvestView> createState() => _InvestViewState();
}

class _InvestViewState extends State<InvestView> {
  final _investmentController = TextEditingController();
  int _investmentPercentage = 0;

  @override
  void dispose() {
    _investmentController.dispose();
    super.dispose();
  }

  void _getInvestmentPercentage() {
    final investmentString = _investmentController.text.trim();
    if (investmentString.isNotEmpty) {
      final investmentValue = int.tryParse(investmentString);
      if (investmentValue != null && investmentValue <= 100) {
        setState(() {
          _investmentPercentage = investmentValue;
        });
      } else {
        // Handle invalid input
        setState(() {
          _investmentPercentage = 0;
        });
      }
    } else {
      setState(() {
        _investmentPercentage = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 236, 241),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 140),
                    child: Container(
                      height: 35,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF17B861),
                      ),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgectInfoView(
                                    projectModel: widget.progectModel,
                                    userEntity: widget.userEntity)),
                          );
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
              ),
              Container(
                height: 44,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'owner: ${widget.userEntity.userName}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'dongel'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 44,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'contact: ${widget.userEntity.phone}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'dongel'),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                'Add your Investment Percentage ',
                style: TextStyle(
                    color: Colors.black, fontSize: 22, fontFamily: 'dongel'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (_) => _getInvestmentPercentage(),
                controller: _investmentController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Investment Value Percentage',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF17B861),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          ProjectsServices2().investProgect(
                              progectId: widget.progectModel.id!,
                              percentage: _investmentPercentage);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProjectSuccess()),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'Apply',
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
        ),
      ),
    );
  }
}
