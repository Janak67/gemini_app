import 'package:advance_exam/custom_widget/common_app_bar.dart';
import 'package:advance_exam/custom_widget/log_out_dialog.dart';
import 'package:advance_exam/utils/import.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  LikeController controller = Get.put(LikeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(title: 'Setting'),
        body: Stack(
          children: [
            Obx(
              () => controller.isLight.value == false
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
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Text('${FireHelper.fireHelper.user!.email}'
                              .toUpperCase()
                              .substring(0, 1)),
                        ),
                        SelectableText('${FireHelper.fireHelper.user!.email}',
                            style: comic20),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Obx(
                    () => controller.isLight.value == false
                        ? Icon(Icons.dark_mode_outlined)
                        : Icon(Icons.light_mode_outlined),
                  ),
                  title: Text('Theme', style: comic20),
                  trailing: Obx(
                    () => Switch(
                      value: controller.isLight.value,
                      onChanged: (value) {
                        ShareHelper.shareHelper.setTheme(value);
                        controller.changeTheme();
                      },
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Get.toNamed('like'),
                  leading: Icon(Icons.history_outlined),
                  title: Text('Search History', style: comic20),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                ),
                ListTile(
                  onTap: () => logOutDialog(context),
                  leading: Icon(Icons.logout_outlined),
                  title: Text('Logout', style: comic20),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
