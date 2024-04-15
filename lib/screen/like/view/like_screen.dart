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
  LikeController controller = Get.put(LikeController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
        ),
        body: Obx(
          () => controller.searchList.isEmpty
              ? const Center(child: Text('No Data'))
              : ListView.builder(
                  itemCount: controller.searchList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        deleteDialog(context);
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
                        child: Text('${controller.searchList[index].result}'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
