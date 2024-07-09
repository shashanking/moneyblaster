import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/widgets/animated_background.dart';
import 'package:ff_moneyblaster/feautres/auth/shared/provider.dart';
import 'package:ff_moneyblaster/routes/app_router.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage(name: 'SplashScreen')
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authNotifer = ref.watch(authProvider.notifier);
      // authNotifer.calculateAndUpdateTotalEarning();
      await Future.delayed(const Duration(seconds: 2));
      final state = ref.watch(authProvider);
      bool hasUser = await authNotifer.checkCurrentUser();

      if (hasUser) {
        await authNotifer.checkIsUserVerified().then((value) {
          if (value) {
            context.router.replaceAll([const BaseRoute()]);
          } else {
            context.router.replaceAll([const LoadingScreen()]);
          }
        });
      } else {
        if (context.mounted) {
          context.router.replaceAll([const OnboardingScreen()]);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            const AnimatedBackground(),
            Align(
              child: Center(
                child: Image.asset(Assets.logo),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
