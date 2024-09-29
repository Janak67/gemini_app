import 'package:advance_exam/utils/import.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final LikeController likeController = Get.put(LikeController());

  AppBarView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Stack(
        children: [
          Obx(
            () => likeController.isLight.value == false
                ? Image.asset(
                    'assets/img/chat.jpg',
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/img/background.jpg',
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
          ),
          Obx(
            () => Container(
              color: likeController.isLight.value
                  ? Colors.white.withOpacity(0.2)
                  : Colors.black.withOpacity(0.2),
            ),
          ),
        ],
      ),
      title: Text(title, style: comic),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
