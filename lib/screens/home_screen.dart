// ignore_for_file: library_private_types_in_public_api

import 'package:clash_flutter/core/util/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../routes/route_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(22.0),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(
              color: const Color(0xFF323232),
              width: 1.0,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/home.svg',
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              'assets/images/stat.svg',
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              'assets/images/profile.svg',
              color: IconTheme.of(context).color,
              height: 30.0,
              width: 30.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
            child: TextButton(
          onPressed: () {
           Navigator.of(context).pushNamed(RouteGenerator.clashRoomScreen,);
          },
          child: const Text(
            'Play',
          ),
        )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    NotificationUtil.setupInteractedMessage(context);
  }


}



