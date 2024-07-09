import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/notification/shared/provider.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

@RoutePage(name: 'NotificationScreen')
class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(notificationProvider.select((state) => state.isLoading));
    final notifications =
        ref.watch(notificationProvider.select((state) => state.notifications));

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1,
      decoration: BoxDecoration(
        color: AppColors.blackBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/bg.png',
          ).image,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.15,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(206, 59, 59, 1),
                        Color.fromRGBO(95, 18, 55, 1),
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, top: 48, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'NOTIFICATIONS',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          // const ProfileTaB(),
          // tab bar
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: notifications.isNotEmpty,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(notificationProvider.notifier)
                          .clearNotifications();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0x68FFFFFF),
                        borderRadius: BorderRadius.circular(35),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Clear All',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
              height: 70.h,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: notifications.isEmpty
                    ? Center(
                        child: Text(
                          'No notifications available',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: notifications.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return NoticationCard(
                            msg: notification['msg'] ?? '',
                            timestamp: notification['timestamp'] ?? '',
                          );
                        }),
              )),
        ],
      ),
    );
  }
}

class NoticationCard extends StatelessWidget {
  const NoticationCard({
    Key? key,
    required this.msg,
    required this.timestamp,
  }) : super(key: key);

  final String msg;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration:
              customDecoration.copyWith(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 36,
                  width: 36,
                  decoration: customDecoration.copyWith(
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    Assets.notificationImg,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    msg,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0, right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timestamp,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppColors.greyLight, fontSize: 10),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
