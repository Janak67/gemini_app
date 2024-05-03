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
              onPressed: () => Get.toNamed('like'),
              icon: const Icon(Icons.history, color: Colors.white),
            ),
          ],
        ),
        body: Stack(
          children: [
            Image.asset('assets/img/background.jpg',
                height: MediaQuery.sizeOf(context).height,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
                opacity: const AlwaysStoppedAnimation(0.6)),
            Obx(
              () => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        final reversedIndex =
                            controller.list.length - index - 1;
                        return Align(
                          alignment: controller.list[index].status == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red.withOpacity(0.2),
                                    Colors.blue.withOpacity(0.2)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              '${controller.list[reversedIndex].result}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: controller.isLoading,
                    builder:
                        (BuildContext context, dynamic value, Widget? child) {
                      if (!value) {
                        return const SizedBox();
                      }
                      return const SpinKitThreeBounce(
                          color: Colors.deepPurple, size: 30);
                    },
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 55,
                  child: SearchBar(
                    controller: txtSearch,
                    elevation: MaterialStateProperty.all(1),
                    hintText: 'search...',
                    trailing: [
                      ValueListenableBuilder(
                        valueListenable: controller.isLoading,
                        builder: (BuildContext context, dynamic value,
                            Widget? child) {
                          if (value) {
                            return const SpinKitFadingCircle(
                                size: 30, color: Colors.deepPurple);
                          }
                          return InkWell(
                            onTap: () async {
                              DbModel dbModel =
                                  DbModel(result: txtSearch.text, status: 0);
                              DbHelper.dbHelper.insertData(dbModel);
                              controller.chatList.add(dbModel);
                              controller.list.add(dbModel);
                              await controller.getData(txtSearch.text);
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
            ),
          ],
        ),
      ),
    );
  }
}
