import 'package:flutter/material.dart';

import '../constants.dart';

class CreateClashRoom extends StatelessWidget {
  const CreateClashRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: green200,
          ),
        ),
        body: Column(

        ),
      ),
    );
  }
}
