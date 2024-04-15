import 'package:advance_exam/screen/home/controller/home_controller.dart';
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
  void initState() {
    super.initState();
    controller.getData("Write a story about a magic backpack.");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: controller.homeModel == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: txtSearch,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                    // Text(
                    //   '${controller.homeModel!.candidates![0].finishReason}',
                    //   style: const TextStyle(fontSize: 18),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}
