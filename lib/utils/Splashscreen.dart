import 'package:flutter/material.dart';
import 'package:retirement_app/screens/Mainpage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2500));
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => MainPage()), (Route) => false);
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            height: devicesize.height * 0.25,
            child: SvgPicture.asset('assets/trr.svg')),
      ),
    );
  }
}
