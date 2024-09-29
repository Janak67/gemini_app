import 'package:advance_exam/utils/import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? status;

  @override
  void initState() {
    super.initState();
    bool isLogin = FireHelper.fireHelper.checkUser();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offAllNamed(status == false || status == null
            ? 'intro'
            : isLogin == false
                ? 'login'
                : 'home');
      },
    );
    createIntro();
  }

  Future<void> createIntro() async {
    status = await ShareHelper.shareHelper.getIntro();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Lottie.asset('assets/json/Animation.json', height: 150),
        ),
      ),
    );
  }
}
