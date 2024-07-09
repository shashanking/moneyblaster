import 'package:ff_moneyblaster/core/assets.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart' as riv;

class GradientBorderContainerText extends StatefulWidget {
  const GradientBorderContainerText({
    super.key,
    this.width,
    this.height,
    required this.colors,
    this.radius = 8.0,
    required this.child,
    this.isActive = false,
  });

  final double? width;
  final double? height;
  final List<Color> colors;
  final double radius;
  final String child;
  final bool isActive;

  @override
  State<GradientBorderContainerText> createState() =>
      _GradientBorderContainerTextState();
}

class _GradientBorderContainerTextState
    extends State<GradientBorderContainerText> {
  final unfocusNode = FocusNode();
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    '',
  ];
  List<riv.RiveAnimationController> riveAnimationControllers = [];

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    // riveAnimationAnimationsList.forEach((name) {
    //   riveAnimationControllers.add(FlutterFlowRiveController(
    //     name,
    //     shouldLoop: true,
    //   ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: widget.height,
            width: widget.width,
            // decoration: BoxDecoration(
            //   border: GradientBoxBorder(
            //     gradient: LinearGradient(
            //         colors: widget.colors,
            //         begin: Alignment.centerLeft,
            //         end: Alignment.centerRight),
            //     width: 2,
            //   ),
            // ),
            child: ClipRRect(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.child,
                    ),
                    Visibility(
                        visible: widget.isActive &&
                            widget.child.toLowerCase() == 'ongoing',
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 4),
                            Image.asset(
                              Assets.fire,
                              scale: 2,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ))),
        Positioned(
          // Position the gradient container at the bottom
          bottom: 0,
          left: 0,
          right: 0,
          child: Visibility(
            visible: widget.isActive,
            child: Container(
              height: 2, // Adjust gradient height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.colors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
