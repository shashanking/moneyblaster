import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/auth/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardSwapAnimation extends ConsumerStatefulWidget {
  const CardSwapAnimation({Key? key}) : super(key: key);

  @override
  CardSwapAnimationState createState() => CardSwapAnimationState();
}

class CardSwapAnimationState extends ConsumerState<CardSwapAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _frontCardScaleAnimation;
  late Animation<double> _frontCardFadeAnimation;
  late Animation<double> _backCardScaleAnimation;
  late Animation<double> _backCardFadeAnimation;
  bool _toggle = true; // State to track which card is on top

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _frontCardScaleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _frontCardFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _backCardScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _backCardFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final notifier = ref.read(authProvider.notifier);
      notifier.selectGame(AppConstants.gamesList.last);
    });
  }

  String gameName = AppConstants.gameOption.last;

  @override
  Widget build(
    BuildContext context,
  ) {
    final state = ref.watch(authProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Your title widget
        Text(
          AppConstants.selectGame.toUpperCase(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 24,
        ),
        // Stack to hold the animated cards
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Front Card
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _frontCardScaleAnimation.value,
                  child: Opacity(
                    opacity: _frontCardFadeAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                'assets/images/gamecard1.png',
                key: const ValueKey('card1'),
              ),
            ),
            // Back Card
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _backCardScaleAnimation.value,
                  child: Opacity(
                    opacity: _backCardFadeAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                'assets/images/gamecard2.png',
                key: const ValueKey('card2'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Row of buttons to trigger the card swap
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Transform.rotate(
                angle: 1,
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _toggle ? _controller.forward() : _controller.reverse();
                _toggle = !_toggle;
                toggleGame(_toggle);
              },
            ),
            Text(
              state.gameOptionSelected ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 20),
            ),
            IconButton(
              icon: Transform.rotate(
                angle: 0,
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _toggle ? _controller.forward() : _controller.reverse();
                _toggle = !_toggle;
                toggleGame(_toggle);
              },
            ),
          ],
        ),
      ],
    );
  }

  void toggleGame(bool toggle) {
    setState(() {
      final authNotfier = ref.read(authProvider.notifier);

      toggle
          ? gameName = AppConstants.gamesList.last
          : gameName = AppConstants.gamesList.first;

      authNotfier.selectGame(gameName);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
