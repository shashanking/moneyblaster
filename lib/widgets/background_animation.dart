import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackgroundAnimation extends StatelessWidget {
  const BackgroundAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/background.lottie',
      fit: BoxFit.cover,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class BackgroundVideo extends StatefulWidget {
//   @override
//   State<BackgroundVideo> createState() => _BackgroundVideoState();
// }

// class _BackgroundVideoState extends State<BackgroundVideo> {
//   final VideoPlayerController _controller = VideoPlayerController.asset('assets/animations/background.mp4');

//   @override
//   void initState() {
//     super.initState();
//     _controller.initialize().then((_) {
//         _controller.play();
//         _controller.setLooping(true);
//         // Ensure the first frame is shown after the video is initialized
//         setState(() {});
//       });
//   }

//   @override  
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             SizedBox.expand(
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 child: SizedBox(
//                   width: _controller.value.size?.width ?? 0,
//                   height: _controller.value.size?.height ?? 0,
//                   child: VideoPlayer(_controller),
//                 ),
//               ),
//             ),
//             LoginWidget()
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }