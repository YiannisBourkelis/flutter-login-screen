import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var obscurePasswordText = false;

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: Align(
        //vertical and horizontal aligment of content
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: shortestSide > 430 ? 400 : shortestSide - 30),
            child: Column(
              children: [
                const Image(
                    image: AssetImage('assets/images/flutter_logo.png'),
                    alignment: Alignment.center),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to Super-Duper App!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 27, color: Colors.white70),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_rounded),
                        label: const Text('Email'),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 81, 210, 242),
                        ),
                        fillColor: const Color.fromARGB(255, 4, 55, 97),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: obscurePasswordText,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_clock_rounded),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscurePasswordText = !obscurePasswordText;
                              });
                            },
                            child: Icon(obscurePasswordText
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye)),
                        label: const Text('Password'),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 81, 210, 242),
                        ),
                        fillColor: const Color.fromARGB(255, 4, 55, 97),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green[800]!),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {},
                        child: const Text('Login'))),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot your password?'),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 9,
                        endIndent: 15,
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 15,
                      endIndent: 9,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 40, 76, 154)),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {},
                      child: const Text('Create account')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
