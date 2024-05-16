import 'package:advance_exam/screen/home/controller/home_controller.dart';
import 'package:advance_exam/screen/like/controller/like_controller.dart';
import 'package:advance_exam/utils/text_style.dart';
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
  LikeController likeController = Get.put(LikeController());

  @override
  void initState() {
    super.initState();
    controller.dbData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorite',style: comic),
        ),
        body: Stack(
          children: [
            Obx(
              () => likeController.isLight.value == false
                  ? Image.asset('assets/img/chat.jpg',
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                      opacity: const AlwaysStoppedAnimation(0.6))
                  : Image.asset('assets/img/background.jpg',
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                      opacity: const AlwaysStoppedAnimation(0.6)),
            ),
            Obx(
              () => controller.chatList.isEmpty
                  ? const Center(child: Text('No Data'))
                  : ListView.builder(
                      itemCount: controller.chatList.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: controller.chatList[index].status == 0
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Dismissible(
                            onDismissed: (direction) {
                              deleteDialog(context, index);
                            },
                            direction: DismissDirection.endToStart,
                            key: Key('${controller.chatList[index]}'),
                            background: Container(color: Colors.black12),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors:
                                        likeController.isLight.value == false
                                            ? [
                                                Colors.white.withOpacity(0.4),
                                                Colors.blue.withOpacity(0.4)
                                              ]
                                            : [
                                                Colors.red.withOpacity(0.25),
                                                Colors.blue.withOpacity(0.25)
                                              ],
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                '${controller.chatList[index].result}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,fontFamily: 'comic',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
