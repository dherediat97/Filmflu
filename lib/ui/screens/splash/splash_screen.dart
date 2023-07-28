//Core Packages
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//My Packages
import 'package:FilmFlu/ui/screens/main/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        toolbarHeight: 75,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      AppLocalizations.of(context)!.app_name,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "YsabeauInfant"),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        title: Image.asset('assets/images/transparent_logo.png', height: 60),
        elevation: 48,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash_animation.json',
          controller: _controller,
          height: MediaQuery.of(context).size.height,
          animate: true,
          reverse: false,
          repeat: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  ));
          },
        ),
      ),
    );
  }
}
