import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:gradient_borders/gradient_borders.dart';

class GradientBorderContainer extends StatefulWidget {
  const GradientBorderContainer({
    super.key,
    this.width,
    this.height,
    required this.colors,
    this.radius = 8.0,
    required this.child,
    this.assetChild,
  });

  final double? width;
  final double? height;
  final List<Color> colors;
  final double radius;
  final String child;
  final String? assetChild;
  @override
  State<GradientBorderContainer> createState() =>
      _GradientBorderContainerState();
}

class _GradientBorderContainerState extends State<GradientBorderContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: LinearGradient(
                  colors: widget.colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(widget.radius)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: widget.assetChild == null ? Image.network(
            widget.child,
            fit: BoxFit.cover,
          ) : Image.asset(
            widget.assetChild!,
            fit: BoxFit.cover,
          ),
        ));
  }
}
