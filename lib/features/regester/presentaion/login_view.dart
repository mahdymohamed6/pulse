import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:investify/features/control_page.dart';
import 'package:investify/features/regester/data/auth_services.dart';
import 'package:investify/features/regester/role_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  // ignore: unused_field
  bool _isLoading = false;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      bool success = await AuthServices().logIn(
          email: emailController.text, password: passwordController.text);
      setState(() {
        _isLoading = false;
      });
      if (success) {
        _scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('account created successfully'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ControlPage()),
        );
      } else {
        _scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('incorrect email or password'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 248, 248),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 160,
                    width: 180,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' Already have\nan Account?',
                    style: TextStyle(
                        color: Color(0XFF565656),
                        fontSize: 24,
                        fontFamily: 'dongel'),
                    softWrap: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: 'dangrek'),
                    softWrap: false,
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: const Color.fromARGB(255, 103, 101, 101)),
                      decoration: const InputDecoration(
                        label: Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF17B861)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 11, 141, 72)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your PassWord';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text(
                          'PassWord',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF17B861)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 11, 141, 72)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 250, top: 16),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Color(0xFF17B861)),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  _login();
                },
                child: Container(
                  height: 61,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF17B861),
                  ),
                  child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Color(0XFFE6FDF0),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'dangrek',
                                color: Color(0XFFE6FDF0),
                              ),
                            )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220, top: 18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RoleView()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17B861),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
