import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/http_response.dart';

mixin ResponseHandler {
  void handleResponse(BuildContext context, Status status) async {
    if (status == Status.reAuthenticate) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            status.message(),
          ),
        ),
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteGenerator.authScreen, (route) => false);
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
    } else if (status != Status.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            status.message(),
          ),
        ),
      );
    }
  }
}
