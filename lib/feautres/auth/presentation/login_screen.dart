import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/widgets/animated_background.dart';
import 'package:ff_moneyblaster/feautres/auth/shared/provider.dart';
import 'package:ff_moneyblaster/routes/app_router.gr.dart';
import 'package:ff_moneyblaster/widgets/glazed_button.dart';
import 'package:ff_moneyblaster/widgets/login_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

@RoutePage(name: 'LoginScreen')
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final VideoPlayerController _controller =
      VideoPlayerController.asset('assets/animations/background.mp4');
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool keyboard = MediaQuery.of(context).viewInsets.bottom > 0;
    final isLoading =
        ref.watch(authProvider.select((state) => state.isLoading));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SvgPicture.asset(
                              "assets/images/Login.svg",
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                              // color: Colors.white,
                              width: 90,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Transform.translate(
                            offset: const Offset(-120, 0),
                            child: SvgPicture.asset(
                                "assets/images/underline.svg",
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn)
                                // color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 12,
                      child: SizedBox.expand(),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: LoginTextField(
                                  title: "Phone Number",
                                  hintText: "Enter Phone Number",
                                  controller: _phoneController,
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: LoginTextField(
                            //     title: "Game ID",
                            //     hintText: "Enter game ID",
                            //     controller: TextEditingController(),
                            //   ),
                            // ),
                            // Expanded(
                            //   child: LoginTextField(
                            //     title: "Password",
                            //     isPassword: true,
                            //     hintText: "Enter Password",
                            //     controller: _passwordController,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GlazedButton(
                        onTap: () {
                          if (!isLoading) {
                            ref.read(authProvider.notifier).signIn(
                                  context,
                                  phone: _phoneController.text,
                                  
                                );
                          }
                        },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an Account? ',
                        style: const TextStyle(color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4AE5E5),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                debugPrint("Go to sign up");
                                await context.router.push(const SignupScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
