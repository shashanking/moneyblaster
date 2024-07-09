import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailingText;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailingText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/textfield.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Apex',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '₹10',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xff00dede),
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  trailingText,
                  style: TextStyle(
                    fontFamily: 'Apex',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
