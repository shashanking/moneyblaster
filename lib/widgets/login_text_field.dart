import 'package:ff_moneyblaster/core/assets.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String hintText;
  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final Function(String)? onChanged;
  final TextInputType? textInputType;

  const LoginTextField(
      {Key? key,
      required this.hintText,
      this.isPassword = false,
      required this.controller,
      required this.title,
      this.textInputType = TextInputType.text,
      this.onChanged})
      : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool passVisible = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Stack(
            children: [
              Image.asset(
                "assets/images/textfield.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: TextFormField(
                    keyboardType: widget.textInputType,
                    obscureText: widget.isPassword && !passVisible,
                    controller: widget.controller,
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      suffix: widget.isPassword
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  passVisible = !passVisible;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  passVisible
                                      ? Assets.eyeShown
                                      : Assets.eyeHidden,
                                  scale: 2,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        color: Color(0xffABABAB),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
