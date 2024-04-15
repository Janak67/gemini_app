import 'package:advance_exam/screen/home/controller/home_controller.dart';
import 'package:advance_exam/screen/like/model/db_model.dart';
import 'package:advance_exam/utils/db_helper.dart';
import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(
              () => Column(
                children: [
                  SearchBar(
                    controller: txtSearch,
                    elevation: MaterialStateProperty.all(1),
                    hintText: 'search...',
                    trailing: [
                      IconButton(
                        onPressed: () {
                          controller.getData(txtSearch.text);
                        },
                        icon: const Icon(Icons.search),
                      )
                    ],
                  ),
                  if (controller.isLoading.value)
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation(Colors.blueAccent),
                      minHeight: 1.5,
                    ),
                  const SizedBox(height: 20),
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
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {
                                    DbModel dbModel = DbModel(
                                        result: controller
                                            .homeModel
                                            .value!
                                            .candidates![0]
                                            .content!
                                            .parts![0]
                                            .text);
                                    DbHelper.dbHelper.insertData(dbModel);
                                    Get.snackbar('Favorite Data', 'Success',
                                        duration:
                                            const Duration(milliseconds: 1500));
                                  },
                                  icon: const Icon(Icons.favorite_border),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
