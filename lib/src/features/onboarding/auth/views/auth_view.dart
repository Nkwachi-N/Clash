import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/constants/dimensions.dart';
import 'auth_view_model.dart';

class AuthView extends ViewModelBuilderWidget<AuthViewModel> {
  const AuthView({Key? key}) : super(key: key);


  @override
  Widget builder(BuildContext context, AuthViewModel viewModel,_) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/X42.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'CLASH',
              style: textTheme.displayMedium?.copyWith(
                color: ClashColors.green100,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: viewModel.authorize,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                    child: Image.asset(
                      'assets/images/Spotify_Icon_White.png',
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Continue with Spotify',
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Visibility(
                    visible: viewModel.isBusy,
                    child: const SpinKitThreeBounce(
                      color: Colors.white,
                      size: kButtonLoaderSize,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  AuthViewModel viewModelBuilder(BuildContext context) => AuthViewModel();
}
