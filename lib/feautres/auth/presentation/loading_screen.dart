import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/feautres/auth/shared/provider.dart';
import 'package:ff_moneyblaster/widgets/glazed_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

@RoutePage(name: 'LoadingScreen')
class LoadingScreen extends ConsumerWidget {
  // Changed from StatelessWidget to ConsumerWidget
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      debugPrint("Calling Again...");
      ref
          .read(authProvider.notifier)
          .isCurrentUserVerified(context, timer: timer);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/loading_bg.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/loading_header.png'),
                const CarouselWidget(),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(height: 45, child: CarouselTextWidget()),
                const SizedBox(
                  height: 30,
                ),
                GlazedButtonFilled(
                  onTap: () {},
                  child: SizedBox(
                    height: 40,
                    child: Center(
                      child: OverflowBox(
                        minHeight: 0,
                        maxHeight: double.infinity,
                        alignment: Alignment.center,
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.center,
                            heightFactor: 1,
                            widthFactor: 0.5,
                            child: LottieBuilder.asset(
                              "assets/animations/3dot.json",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Self-contained Carousel Widget
class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final PageController _controller = PageController();
  Timer? _timer;
  final int _numPages = 5;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      int nextPage = _controller.page!.toInt() + 1;
      if (nextPage == _numPages) {
        _controller.jumpToPage(0);
      } else {
        _controller.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Image.asset('assets/images/loading1.png', fit: BoxFit.contain),
              Image.asset('assets/images/loading2.png', fit: BoxFit.contain),
              Image.asset('assets/images/loading3.png', fit: BoxFit.contain),
              Image.asset('assets/images/loading4.png', fit: BoxFit.contain),
              Image.asset('assets/images/loading1.png', fit: BoxFit.contain),
            ],
          ),
          Align(
            alignment: const Alignment(0, 2.5),
            child: Image.asset('assets/images/loading_cloud.png'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}

class CarouselTextWidget extends StatefulWidget {
  const CarouselTextWidget({Key? key}) : super(key: key);

  @override
  State<CarouselTextWidget> createState() => _CarouselTextWidgetState();
}

class _CarouselTextWidgetState extends State<CarouselTextWidget> {
  final PageController _controller = PageController();
  Timer? _timer;
  final int _numPages = 5;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_controller.hasClients) {
        int nextPage = _controller.page!.toInt() + 1;
        if (nextPage >= _numPages) {
          _controller.animateToPage(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: const <Widget>[
          Center(
            child: Text(
              "LOADING GUNS",
              style: TextStyle(
                fontFamily: 'Apex',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "LOADING ASSETS",
              style: TextStyle(
                fontFamily: 'Apex',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "PREPARING TEAM",
              style: TextStyle(
                fontFamily: 'Apex',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "FUELING UP CAR",
              style: TextStyle(
                fontFamily: 'Apex',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "WAITING FOR PLAYERS",
              style: TextStyle(
                fontFamily: 'Apex',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}

// class MovingGradientBar extends StatefulWidget {
//   final double height;
//   final double width;

//   const MovingGradientBar({
//     Key? key,
//     this.height = 5.0,
//     this.width = 200.0,
//   }) : super(key: key);

//   @override
//   _MovingGradientBarState createState() => _MovingGradientBarState();
// }

// class _MovingGradientBarState extends State<MovingGradientBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, child) {
//         return Container(
//           width: widget.width,
//           height: widget.height,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5.0),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.red,
//                 Colors.orange,
//                 Colors.yellow,
//                 Colors.green,
//                 Colors.blue,
//                 Colors.indigo,
//                 Colors.red,
//               ],
//               stops: [0.0, 0.14, 0.28, 0.42, 0.56, 0.70, 0.84, 1.0],
//               begin: Alignment(-1.0 - _controller.value * 2, 0.0),
//               end: Alignment(1.0 - _controller.value * 2, 0.0),
//               tileMode: TileMode.clamp,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
