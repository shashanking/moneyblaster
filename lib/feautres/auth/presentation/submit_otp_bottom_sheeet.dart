import 'dart:async';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/utils/toast.dart';
import 'package:ff_moneyblaster/feautres/auth/shared/provider.dart';
import 'package:ff_moneyblaster/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:ff_moneyblaster/widgets/app_text_field.dart';

class SubmitOtpPopup extends ConsumerStatefulWidget {
  final String verificationId;

  final String phoneNumber;

  const SubmitOtpPopup({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  ConsumerState<SubmitOtpPopup> createState() => _SubmitOtpPopupState();
}

class _SubmitOtpPopupState extends ConsumerState<SubmitOtpPopup> {
  final TextEditingController _otpController = TextEditingController();
  Timer? _timer;
  int _start = 60;
  bool _isResendAllowed = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 60;
    _isResendAllowed = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          _isResendAllowed = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: customDecoration.copyWith(
          color: AppColors.popUpColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1 title and x
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Submit OTP",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    Assets.close,
                    scale: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              hintText: "Enter OTP",
              controller: _otpController,
              keyboardType: TextInputType.number,
              title: "OTP",
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _isResendAllowed
                      ? () {
                          // Implement your resend OTP logic here
                          startTimer();
                        }
                      : null,
                  child: Text(
                    _isResendAllowed
                        ? "Resend OTP"
                        : "Resend in $_start seconds",
                    style: TextStyle(
                      color: _isResendAllowed ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                if (_otpController.text.isNotEmpty) {
                  try {
                    // Create a PhoneAuthCredential with the code
                    final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: _otpController.text,
                    );

                    // Sign in the user with the credential
                    final userCredential =
                        await FirebaseAuth.instance.signInWithCredential(
                      credential,
                    );

                    await notifier.createUser(context,
                        uid: userCredential.user!.uid);
                  } catch (e) {
                    showToastMessage('Failed to verify OTP. Please try again.');
                    print('Error: $e');
                  }
                } else {
                  showToastMessage('Please enter OTP');
                }
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(206, 59, 59, 1),
                      Color.fromRGBO(95, 18, 55, 1),
                    ],
                  ),
                ),
                child: Center(
                  child: Visibility(
                    visible: !state.isLoading,
                    replacement: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSubmitOtpPopup(
  BuildContext context,
  String verificationId,
  String phoneNumber,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BlurBackground(
        child: SubmitOtpPopup(
          verificationId: verificationId,
          phoneNumber: phoneNumber,
        ),
      );
    },
  );
}

class BlurBackground extends StatelessWidget {
  final Widget child;

  const BlurBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Center(child: child),
      ],
    );
  }
}
