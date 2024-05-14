import 'dart:ui';
import 'package:advance_exam/utils/helper/fire_helper.dart';
import 'package:advance_exam/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/bg4.webp'), fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          child: Container(
            height: 400,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Center(
                        child: TextUtil(
                          text: 'Login',
                          weight: true,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      TextUtil(text: 'Email'),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                        child: TextFormField(
                          controller: txtEmail,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.mail, color: Colors.white),
                              fillColor: Colors.white,
                              border: InputBorder.none),
                        ),
                      ),
                      const Spacer(),
                      TextUtil(text: 'Password'),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                        child: TextFormField(
                          controller: txtPassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.lock, color: Colors.white),
                              fillColor: Colors.white,
                              border: InputBorder.none),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(height: 15, width: 15, color: Colors.white),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextUtil(
                                text: 'Remember Me , FORGET PASSWORD',
                                size: 12,
                                weight: true),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          onPressed: () async {
                            String message = await FireHelper.fireHelper
                                .createAccount(
                                    email: txtEmail.text,
                                    password: txtPassword.text);
                            Get.snackbar(message, '');
                            Get.toNamed('home');
                          },
                          child: TextUtil(text: 'Login', color: Colors.black),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: TextUtil(
                            text: "Don't have a account REGISTER",
                            size: 12,
                            weight: true),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
