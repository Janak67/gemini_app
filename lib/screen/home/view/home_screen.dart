import 'package:advance_exam/screen/home/controller/home_controller.dart';
import 'package:advance_exam/screen/like/model/db_model.dart';
import 'package:advance_exam/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'AI',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('like');
              },
              icon: const Icon(
                Icons.history,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: controller.isLoading,
                        builder: (BuildContext context, dynamic value,
                            Widget? child) {
                          if (!value) {
                            return const SizedBox();
                          }
                          return const SpinKitThreeBounce(
                              color: Colors.deepPurple, size: 30);
                        },
                      ),
                      controller.homeModel.value == null
                          ? const Text('')
                          : Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red.withOpacity(0.2),
                                      Colors.blue.withOpacity(0.2)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    '${controller.homeModel.value!.candidates![0].content!.parts![0].text}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SearchBar(
                  controller: txtSearch,
                  elevation: MaterialStateProperty.all(1),
                  hintText: 'search...',
                  trailing: [
                    ValueListenableBuilder(
                      valueListenable: controller.isLoading,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        if (value) {
                          return const CircularProgressIndicator(
                              color: Colors.deepPurple);
                        }
                        return InkWell(
                          onTap: () {
                            DbModel dbModel = DbModel(result: txtSearch.text);
                            DbHelper.dbHelper.insertData(dbModel);
                            controller.getData(txtSearch.text);
                            txtSearch.clear();
                          },
                          child: const Icon(Icons.send,
                              size: 25, color: Colors.deepPurple),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// if (controller.isLoading.value)
//   LinearProgressIndicator(
//     backgroundColor: Colors.grey[300],
//     valueColor:
//         const AlwaysStoppedAnimation(Colors.blueAccent),
//     minHeight: 5,
//   ),
// IconButton(
//   onPressed: () {
//     DbModel dbModel = DbModel(result: txtSearch.text);
//     DbHelper.dbHelper.insertData(dbModel);
//     controller.getData(txtSearch.text);
//   },
//   icon: const Icon(Icons.send),
// )
