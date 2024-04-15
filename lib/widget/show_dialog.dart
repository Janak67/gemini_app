import 'package:advance_exam/screen/like/controller/like_controller.dart';
import 'package:advance_exam/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void deleteDialog(BuildContext context, int index) {
  LikeController controller = Get.put(LikeController());
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Are you sure to Delete'),
        content: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                DbHelper.dbHelper
                    .deleteData(id: '${controller.searchList[index].id}');
                controller.getData();
                Get.back();
                Get.snackbar('Delete', 'Success',
                    duration: const Duration(milliseconds: 1500));
              },
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('No'),
            ),
          ],
        ),
      );
    },
  );
}
