import 'package:advance_exam/utils/import.dart';

logOutDialog(BuildContext context) {
  LikeController likeController = Get.put(LikeController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Obx(
              () => likeController.isLight.value == false
                  ? Image.asset('assets/img/chat.jpg',
                      height: 280,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width)
                  : Image.asset('assets/img/background.jpg',
                      height: 280,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                      opacity: const AlwaysStoppedAnimation(0.85)),
            ),
            Container(
              height: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.teal, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.logout_outlined,
                        color: Colors.white, size: 35),
                  ),
                  SizedBox(height: 20),
                  Text('Are You Sure?', style: comic20),
                  SizedBox(height: 10),
                  Text('Do you want to logout?', style: comic16),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('No', style: txt16),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        child: ElevatedButton(
                          onPressed: () {
                            FireHelper.fireHelper.logOut();
                            Get.snackbar('logOut', 'Success');
                            Get.offAllNamed('login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Yes', style: txt16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
