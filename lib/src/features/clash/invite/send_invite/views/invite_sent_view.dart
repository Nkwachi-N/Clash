// ignore_for_file: library_private_types_in_public_api

import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/features/clash/invite/send_invite/views/invite_sent_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class InviteSentView extends StatefulWidget {
  final String username;

  const InviteSentView({Key? key,required this.username}) : super(key: key);

  @override
  _InviteSentViewState createState() => _InviteSentViewState();
}

class _InviteSentViewState extends State<InviteSentView>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  double waveGap = 100.0;
  late Animation<double> _animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(
          milliseconds: 1500,
        ),
        vsync: this);

    controller.forward();
    _animation = Tween(begin: 10.0, end: waveGap).animate(controller)
      ..addListener(() {
        setState(() {
          waveRadius = _animation.value;
        });
      });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ViewModelBuilder<InviteSentViewModel>.reactive(
        viewModelBuilder: () => InviteSentViewModel(),
        builder: (__, viewModel, _) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(double.infinity, double.infinity),
                  painter: CircleWavePainter(waveRadius),
                ),
                //TODO: Implement cancel functionality.
                /* Align(
            alignment: const Alignment(0.9, -0.85),
            child: InkWell(
              onTap: (){

              },
              child: Container(
                padding: const EdgeInsets.all(12.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ClashColors.grey400),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'CANCEL',
                      style: textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),*/
                Image.asset('assets/images/invite_sent.png'),
                Align(
                  alignment: const Alignment(0.0, 0.75),
                  child: RichText(
                    text: TextSpan(
                        text: 'Inviting ',
                        style: textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '@${widget.username}',
                            style: textTheme.subtitle1?.copyWith(
                              color: ClashColors.green100,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' to your room',
                            style: textTheme.subtitle1?.copyWith(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ]),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.0, 0.82),
                  child: Text('Hang tight',
                      style: textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        color: ClashColors.grey900,
                      )),
                ),
              ],
            ),
          );
        });
  }
}

class CircleWavePainter extends CustomPainter {
  final double waveRadius;
  late Paint wavePaint;

  CircleWavePainter(this.waveRadius) {
    wavePaint = Paint()
      ..color = const Color(0xFF323232).withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2.0;
    double centerY = size.height / 2.0;

    var currentRadius = waveRadius;
    /* while (currentRadius < maxRadius) {
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);
      currentRadius += 100.0;
    }*/
    for (int i = 0; i < 3; i++) {
      currentRadius = currentRadius + (50 * i);

      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.waveRadius != waveRadius;
  }
}
