import 'package:advance_exam/custom_widget/common_app_bar.dart';
import 'package:advance_exam/utils/import.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  HomeController controller = Get.put(HomeController());
  LikeController lController = Get.put(LikeController());

  @override
  void initState() {
    super.initState();
    controller.dbData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(title: 'Favorite'),
        body: Stack(
          children: [
            Obx(
              () => lController.isLight.value == false
                  ? Image.asset('assets/img/chat.jpg',
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                      opacity: const AlwaysStoppedAnimation(0.6))
                  : Image.asset('assets/img/background.jpg',
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                      opacity: const AlwaysStoppedAnimation(0.6)),
            ),
            Obx(
              () => controller.chatList.isEmpty
                  ? Center(
                      child: Lottie.asset('assets/lottie/no_data_found.json',
                          height: 150,
                          width: 130,
                          fit: BoxFit.cover,
                          repeat: false),
                    )
                  : AnimationLimiter(
                      child: ListView.builder(
                        itemCount: controller.chatList.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50,
                              child: FadeInAnimation(
                                child: Align(
                                  alignment:
                                      controller.chatList[index].status == 0
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: Dismissible(
                                    confirmDismiss: (direction) {
                                      return deleteDialog(context, index);
                                    },
                                    onDismissed: (direction) {
                                      controller.deleteData(index);
                                    },
                                    direction: DismissDirection.endToStart,
                                    key: Key('${controller.chatList[index]}'),
                                    background:
                                        Container(color: Colors.black12),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: lController.isLight.value ==
                                                    false
                                                ? [
                                                    Colors.white
                                                        .withOpacity(0.4),
                                                    Colors.blue.withOpacity(0.4)
                                                  ]
                                                : [
                                                    Colors.red
                                                        .withOpacity(0.25),
                                                    Colors.blue
                                                        .withOpacity(0.25)
                                                  ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SelectableText(
                                          '${controller.chatList[index].result}',
                                          style: txt18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
