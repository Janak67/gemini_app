import 'dart:ui';
import 'package:advance_exam/screen/home/controller/home_controller.dart';
import 'package:advance_exam/screen/like/controller/like_controller.dart';
import 'package:advance_exam/screen/login/controller/login_controller.dart';
import 'package:advance_exam/utils/helper/fire_helper.dart';
import 'package:advance_exam/utils/network.dart';
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
  HomeController homeController = Get.put(HomeController());
  LoginController controller = Get.put(LoginController());
  LikeController likeController = Get.put(LikeController());
  NetworkConnection connection = NetworkConnection();

  @override
  void initState() {
    super.initState();
    connection.checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => homeController.isOnline.value
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //       image: Obx(
                  //         () => likeController.isLight.value == false
                  //             ? AssetImage('assets/img/bg4.webp')
                  //             : AssetImage('assets/img/bg2.jpeg'),
                  //       ),
                  //       fit: BoxFit.fill),
                  // ),
                  alignment: Alignment.center,
                  child: Container(
                    height: 400,
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
                                    text: 'Login', weight: true, size: 30),
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
                                  style: const TextStyle(
                                      color: Colors.white, fontFamily: 'comic'),
                                  decoration: const InputDecoration(
                                      suffixIcon:
                                          Icon(Icons.mail, color: Colors.white),
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
                                child: Obx(
                                  () => TextFormField(
                                    obscureText: controller.isHidden.value,
                                    controller: txtPassword,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'comic'),
                                    decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                          onTap: () =>
                                              controller.togglePasswordView(),
                                          child: Icon(
                                              controller.isHidden.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.white),
                                        ),
                                        fillColor: Colors.white,
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Container(
                                      height: 15,
                                      width: 15,
                                      color: Colors.white),
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
                                          WidgetStatePropertyAll(Colors.white)),
                                  onPressed: () async {
                                    String message = await FireHelper.fireHelper
                                        .signIn(
                                            email: txtEmail.text,
                                            password: txtPassword.text);
                                    Get.snackbar(message, '');
                                    if (message == 'Success') {
                                      FireHelper.fireHelper.checkUser();
                                      Get.offAllNamed('home');
                                    }
                                  },
                                  child: TextUtil(
                                      text: 'Login', color: Colors.black),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      FireHelper.fireHelper.loginGuest();
                                      Get.offAllNamed('home');
                                    },
                                    child: Text(
                                      "Don't Have an Account?",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontFamily: 'comic'),
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.blue)),
                                    onPressed: () => Get.toNamed('signUp'),
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'comic'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: Text(
                    'please check Internet Connection',
                    style: TextStyle(fontSize: 20, fontFamily: 'comic'),
                  ),
                ),
        ),
      ),
    );
  }
}
