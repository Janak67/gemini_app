import 'package:advance_exam/utils/import.dart';

Future<bool> deleteDialog(BuildContext context, int index) async {
  bool isDeleted = false;
  HomeController controller = Get.find();
  LikeController likeController = Get.find();
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Are you sure to Delete',
          style: TextStyle(fontFamily: 'comic'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    isDeleted = true;
                    Get.back();
                    Get.snackbar('Delete', 'Success',
                        duration: const Duration(milliseconds: 1000));
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontFamily: 'comic'),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    isDeleted = false;
                    Get.back();
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(fontFamily: 'comic'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Link Copy',
                  style: TextStyle(fontSize: 22, fontFamily: 'comic'),
                ),
                ElevatedButton(
                  onPressed: () {
                    isDeleted = false;
                    likeController.copyToClipboard(
                        '${controller.chatList[index].result}');
                    Get.back();
                  },
                  child: const Text(
                    'Copy',
                    style: TextStyle(fontFamily: 'comic'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  ).then(
    (value) {
      return isDeleted;
    },
  );
}
