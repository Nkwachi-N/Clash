import 'package:clash_flutter/gen/assets.gen.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.images.home,
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              Assets.images.stat,
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              Assets.images.profile,
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
            Navigator.of(context).pushNamed(
              RouteGenerator.clashRoomScreen,
            );
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
    context
        .read<SpotifyRepository>()
        .authenticationListenable
        .addListener(_handleAppLifecycle);
  }

  void _handleAppLifecycle() {
    final spotifyRepo = context.read<SpotifyRepository>();
    final authenticationStatus = spotifyRepo.authenticationListenable.value;
    switch (authenticationStatus) {
      case AuthenticationState.authenticated:

        ///Do Nothing
        break;
      case AuthenticationState.unAuthenticated:
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RouteGenerator.authScreen,
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please re-authenticate with Spotify again'),
            ),
          );
        }
        break;
    }
  }
}
