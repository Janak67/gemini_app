import 'package:advance_exam/screen/home/controller/home_controller.dart';
import 'package:advance_exam/screen/like/controller/like_controller.dart';
import 'package:advance_exam/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.initData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
        ),
        body: Obx(
          () => controller.chatList.isEmpty
              ? const Center(child: Text('No Data'))
              : ListView.builder(
                  itemCount: controller.chatList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onLongPress: () {
                            deleteDialog(context, index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red.withOpacity(0.2),
                                    Colors.blue.withOpacity(0.2)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              '${controller.chatList[index].result}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
