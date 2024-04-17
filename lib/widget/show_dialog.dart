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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    DbHelper.dbHelper
                        .deleteData(id: '${controller.searchList[index].id}');
                    controller.getData();
                    Get.back();
                    Get.snackbar('Delete', 'Success',
                        duration: const Duration(milliseconds: 1000));
                  },
                  child: const Text('Yes'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('No'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Link Copy',
                  style: TextStyle(fontSize: 22),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.copyToClipboard(
                        '${controller.searchList[index].result}');
                    Get.back();
                  },
                  child: const Text('Copy'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
