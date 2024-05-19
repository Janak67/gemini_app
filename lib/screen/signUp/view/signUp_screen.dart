import 'dart:ui';
import 'package:advance_exam/screen/like/controller/like_controller.dart';
import 'package:advance_exam/screen/login/controller/login_controller.dart';
import 'package:advance_exam/utils/helper/fire_helper.dart';
import 'package:advance_exam/utils/text_style.dart';
import 'package:advance_exam/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  LoginController controller = Get.put(LoginController());
  LikeController likeController = Get.put(LikeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(likeController.isLight.value == false
                      ? 'assets/img/bg6.jpeg'
                      : 'assets/img/bg2.jpeg'),
                  fit: BoxFit.fill),
            ),
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.65,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Center(
                          child: TextUtil(
                              text: 'Create Account', weight: true, size: 30),
                        ),
                        TextUtil(
                            text: 'Let`s Create for enter into FlexUI Website.',
                            size: 14,
                            color: Colors.grey),
                        const Spacer(),
                        TextUtil(text: 'Name'),
                        Container(
                          height: 35,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white),
                            ),
                          ),
                          child: TextFormField(
                            style: txt22,
                            decoration: const InputDecoration(
                                suffixIcon:
                                    Icon(Icons.person, color: Colors.white),
                                fillColor: Colors.white,
                                border: InputBorder.none),
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
                            style: txt22,
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
                              style: txt22,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 6 characters long';
                                }
                                if (!value.contains(RegExp(r'[A-Z]'))) {
                                  return 'Password must contain at least one uppercase letter';
                                }
                                if (!value.contains(RegExp(r'[0-9]'))) {
                                  return 'Password must contain at least one numeric character';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white)),
                            onPressed: () async {
                              String msg = await FireHelper.fireHelper
                                  .createAccount(
                                      email: txtEmail.text,
                                      password: txtPassword.text);
                              Get.snackbar(msg, '');
                            },
                            child: TextUtil(
                                text: 'Create Account', color: Colors.black),
                          ),
                        ),
                      ],
                    ),
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
