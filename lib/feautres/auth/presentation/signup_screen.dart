import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/core/utils/toast.dart';
import 'package:ff_moneyblaster/core/widgets/animated_background.dart';
import 'package:ff_moneyblaster/feautres/auth/shared/provider.dart';
import 'package:ff_moneyblaster/routes/app_router.gr.dart';
import 'package:ff_moneyblaster/widgets/glazed_button.dart';
import 'package:ff_moneyblaster/widgets/login_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

@RoutePage(name: 'SignupScreen')
class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  File? img;

  @override
  void initState() {
    super.initState();
  }

  Future<void> selectPhoto() async {
    final status = await Permission.photos.status;
    if (status.isPermanentlyDenied || status.isRestricted || status.isDenied) {
      await _requestPermissionAndPickImage();
    } else {
      await _pickImage();
    }
  }

  Future<void> _requestPermissionAndPickImage() async {
    if (Platform.isAndroid) {
      final storageStatus = await Permission.storage.request();
      if (storageStatus.isGranted) {
        await _pickImage();
      } else if (storageStatus.isPermanentlyDenied || storageStatus.isDenied) {
        if (await Permission.storage.request().isGranted) {
          await _pickImage();
        } else {
          _showPermissionDeniedDialog();
        }
      }
    } else if (Platform.isIOS) {
      final photoStatus = await Permission.photos.request();
      if (photoStatus.isGranted) {
        await _pickImage();
      } else if (photoStatus.isPermanentlyDenied || photoStatus.isDenied) {
        _showPermissionDeniedDialog();
      }
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Denied'),
        content: const Text(
            'Please enable the required permission from the app settings.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      debugPrint(
          'File(pickedFile.path).path.toString(): ${File(pickedFile.path).path.toString()}');
      setState(() {
        img = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(authProvider.select((state) => state.isLoading));
    final notifier = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const AnimatedBackground(),
            SingleChildScrollView(
              child: SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.createAccount.toUpperCase(),
                            style: const TextStyle(
                                fontFamily: 'Apex',
                                // fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 32),
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
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListView(
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            LoginTextField(
                              title: "Username",
                              hintText: "Enter your game username",
                              controller: _usernameController,
                            ),
                            LoginTextField(
                              title: "Game ID",
                              hintText: "Enter your game ID",
                              controller: _gameIdController,
                            ),
                            LoginTextField(
                              title: "Phone Number",
                              hintText: "Enter your phone number",
                              controller: _phoneNumberController,
                              textInputType: TextInputType.phone,
                              // onChanged: (val) {
                              //   if (val.length > 9) {
                              //     notifier
                              //         .setNumber(_phoneNumberController.text);
                              //   }
                              //   setState(() {});
                              // },
                            ),
                            // _phoneNumberController.text.length > 9
                            //     ? GestureDetector(
                            //         onTap: () {
                            //           notifier.verifyNumber(context, () {});
                            //         },
                            //         child: const Row(
                            //           mainAxisSize: MainAxisSize.max,
                            //           mainAxisAlignment: MainAxisAlignment.end,
                            //           children: [
                            //             CustomButton(
                            //               text: 'Verify OTP',
                            //               icon: Icons.sms,
                            //             ),
                            //           ],
                            //         ),
                            //       )
                            //     : const SizedBox.shrink(),
                            // Visibility(
                            //   visible: state.isOtpSent,
                            //   child: LoginTextField(
                            //     title: "Enter OTP",
                            //     hintText: "Enter OTP",
                            //     controller: _otpController,
                            //   ),
                            // ),
                            // LoginTextField(
                            //   title: "Create Password",
                            //   hintText: "Enter password",
                            //   controller: _passwordController,
                            // ),
                            // LoginTextField(
                            //   title: "Confirm Password",
                            //   hintText: "Confirm your password",
                            //   controller: _confirmPasswordController,
                            // ),
                            LoginTextField(
                              title: "Referral Code",
                              hintText: "Enter referral code (if any)",
                              controller: _referralCodeController,
                            ),
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 4.0, vertical: 6),
                            //     child: Row(
                            //       mainAxisSize: MainAxisSize.max,
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Padding(
                            //           padding: const EdgeInsets.only(right: 8.0),
                            //           child: Text(
                            //             AppConstants.uploadGameIdDesc,
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .bodyMedium
                            //                 ?.copyWith(
                            //                     fontWeight: FontWeight.w600),
                            //           ),
                            //         ),
                            //         Stack(
                            //           children: [
                            //             ClipRRect(
                            //               borderRadius: BorderRadius.circular(8),
                            //               child: Image.asset(
                            //                 "assets/images/textfield.png",
                            //                 width: 28.w,
                            //                 height: 45,
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //             const Positioned.fill(
                            //               child: Padding(
                            //                 padding: EdgeInsets.symmetric(
                            //                     horizontal: 10.0, vertical: 6),
                            //                 child: Center(
                            //                   child: Icon(Icons
                            //                       .add_photo_alternate_rounded),
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ],
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: GlazedButtonFilled(
                        onTap: () async {
                          if (!isLoading) {
                            if (_referralCodeController.text.isNotEmpty) {
                              final result =
                                  await notifier.findUserIdByReferralCode(
                                      _referralCodeController.text
                                          .trim()
                                          .toUpperCase());
                              if (result == null || result.toString().isEmpty) {
                                showToastMessage('Invalid Referral Code');
                                showToastMessage(
                                    'Please Verify code Before Continuing');
                              } else {
                                showToastMessage(
                                    'SignUp in Process. Wait for OTP');
                                _handleSignup(
                                    context: context,
                                    referredById: result.toString());
                              }
                            } else {
                              showToastMessage(
                                  'SignUp in Process. Wait for OTP');
                              _handleSignup(context: context);
                            }
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
                        text: 'Already Have an Account? ',
                        style: const TextStyle(color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Log In',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4AE5E5),
                            ),
                            recognizer:
                                TapGestureRecognizer() // for span gestures
                                  ..onTap = () async {
                                    debugPrint("Go to sign up");
                                    await context.router
                                        .push(const LoginScreen());
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
          ],
        ),
      ),
    );
  }

  // void _openOtpBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (BuildContext context) {
  //       return const SubmitOtpBottomSheet();
  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleSignup(
      {required BuildContext context, String? referredById}) async {
    try {
      final notifier = ref.read(authProvider.notifier);
      await notifier.validateAndProceedSignUp(
        context,
        username: _usernameController.text,
        gameId: _gameIdController.text,
        phoneNumber: _phoneNumberController.text,
        password: _passwordController.text,
        referredBy: referredById ?? '',
        // voidCallback: () async {
        //   await context.router.replaceAll([const LoadingScreen()]);
        // },
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'An unknown error occurred')),
          );
        }
      }
    }
  }
}
