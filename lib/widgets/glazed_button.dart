import 'package:flutter/material.dart';

class GlazedButtonFilled extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const GlazedButtonFilled({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  GlazedButtonFilledState createState() => GlazedButtonFilledState();
}

class GlazedButtonFilledState extends State<GlazedButtonFilled>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation(VoidCallback onComplete) {
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        onComplete();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isAnimating = true;
          _isPressed = true;
        });
        _startAnimation(() async {
          setState(() {
            _isPressed = false;
          });
          await Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              _isAnimating = false;
            });
          });
          widget.onTap();
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFF00DEDE).withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF009BDE).withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10.7,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Center(child: widget.child),
              ),
              Image.asset(
                "assets/images/textfield.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
                right: _isPressed ? MediaQuery.of(context).size.width - 60 : 0,
                left: _isPressed ? 0 : MediaQuery.of(context).size.width - 60,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewX(-0.3),
                  child: Container(
                    width: 80,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: _isAnimating
                          ? Colors.white.withOpacity(0.5)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlazedButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const GlazedButton({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  GlazedButtonState createState() => GlazedButtonState();
}

class GlazedButtonState extends State<GlazedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation(VoidCallback onComplete) {
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        onComplete();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isAnimating = true;
          _isPressed = true;
        });
        _startAnimation(() async {
          setState(() {
            _isPressed = false;
          });
          await Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              _isAnimating = false;
            });
          });
          widget.onTap();
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFF00DEDE).withOpacity(0),
                  border: Border.all(
                      color: const Color(0xFF00DEDE).withOpacity(0.7)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16), // Add padding here
                child: Center(child: widget.child),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF00DEDE).withOpacity(0.7))),
                child: Image.asset(
                  "assets/images/textfield.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
                right: _isPressed ? MediaQuery.of(context).size.width - 60 : 0,
                left: _isPressed ? 0 : MediaQuery.of(context).size.width - 60,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewX(-0.3),
                  child: Container(
                    width: 80,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: _isAnimating
                          ? Colors.white.withOpacity(0.5)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
