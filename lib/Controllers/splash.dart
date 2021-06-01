import 'package:flutter/material.dart';
// import 'package:ir_app/Controllers/welcome.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();

    print('create state csllled');
    goToWelcome();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
          child: Image(
        image: AssetImage('assets/logo.png'),
      )),
    );
  }

  void goToWelcome() async {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        // Here you can write your code for open new view
        // Navigator.pushNamed(context, '/welcome');
        Navigator.pushReplacementNamed(context, '/welcome');
        /*  Navigator.of(context).push(
          CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => WelcomeWidget()
          );
        );*/
      });
    });
  }
}
