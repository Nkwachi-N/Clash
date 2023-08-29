import 'package:flutter/material.dart';

///
/// How to use it
/// ExternalCloseSheet.showModal(
///   context,
///   child: Column(
///     children: [
///       Assets.svg.onboardLogo.svg(),
///       verticalSpaceMedium,
///       Text(
///         "Did you know?",
///          style: Theme.of(context).textTheme.subtitle1,
///        ),
///        verticalSpaceMedium,
///        Text(
///           "Your recovery phrase is a special kind of password. It is one way to access your account and must be kept private",
///           style: Theme.of(context).textTheme.bodyText1,
///        ),
///        const SizedBox(
///         height: 30,
///        ),
///     ],
///   ),
///  );

class ExternalCloseSheet {
  static showModal(BuildContext context,
      {required Widget child, Color? backgroundColor}) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF191414),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: child,
      ),
    );
  }
}
