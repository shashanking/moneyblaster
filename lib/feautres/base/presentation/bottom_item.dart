import 'package:ff_moneyblaster/core/constants.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomItem extends StatelessWidget {
  final String icon;
  final String text;
  final bool active;
  const BottomItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 60,
      height: 56,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: icon.isEmpty
          ? Container()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      icon,
                      color: active ? null : AppColors.white.withOpacity(0.5),
                      scale: 2,
                    ),
                    if (active) ...[
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        text,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12, color: AppColors.primaryColor),
                      ),
                    ]
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                if (active)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 1,
                        width: 20.w,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                              Color.fromRGBO(108, 121, 121, 0),
                              Color.fromRGBO(115, 255, 255, 0.7),
                              Color.fromRGBO(115, 255, 255, 0.7),
                              Color.fromRGBO(41, 209, 209, 0.7),
                              Color.fromRGBO(41, 209, 209, 0),
                            ])),
                      )
                    ],
                  )
              ],
            ),
    );
  }
}
