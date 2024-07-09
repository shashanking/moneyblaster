// Adjust the path as necessary

import 'package:ff_moneyblaster/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class ImportantRulesPage extends ConsumerWidget {
  const ImportantRulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.15,
                decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   scale: 2.1,
                  //   image: Image.asset(
                  //     Assets.backgroundLeaderboard,
                  //     fit: BoxFit.contain,
                  //   ).image,
                  // ),
                  gradient: LinearGradient(
                    colors: [Color(0xFFCE3B3B), Color(0xFF5F1237)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(-1, 0),
                    end: AlignmentDirectional(1, 0),
                  ),
                ),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          'IMPORTANT RULES',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // tab bar
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(height: 16),
                    buildRule("RULE (1)",
                        "While joining the Tournament, please check your (BGMI) Free Fire Account Name & your ID No. is correct."),
                    buildRule("RULE (2)",
                        "All the players who are going to play the match should be Registered in Tournament one time."),
                    buildRule("RULE (3)",
                        "You have to sit in the Same Team Slot in the room that you had chosen while joining the tournament otherwise your rewards will not be added."),
                    buildRule("RULE (4)",
                        "You will receive Room ID and Password (Slot No.) within 5 to 10 minutes before the match start time & must wait until the game starts."),
                    buildRule("RULE (5)",
                        "Refund will not be granted if you fail to attend the match on time."),
                    buildRule("RULE (6)",
                        "Only 30+ Level ID Players are allowed to play in our tournaments."),
                    buildRule("RULE (7)",
                        "Emulators are not allowed, Players can play on Android / IOS / Tablets / Phones only."),
                    buildRule("RULE (8)",
                        "Aimbot, No Recoil, ESP, Any type of Hacking is strictly Prohibited. Any game Modifying tools and Glitch and Bugs are not allowed. Team Up With Enemy and BRDM Vehicle is not allowed."),
                    buildRule("RULE (9)",
                        "Everyone start recording your gameplay if you are killed by any hacking; you can report with proof so we can take action against that player."),
                    const SizedBox(height: 20),
                    const Text(
                      "Complaint System:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "1. Go to our MONEY BLASTER app & Check there is game Number.\n"
                      "2. Name and ID NO. that player you are reported.\n"
                      "3. Report within 30 minutes otherwise report not acceptable.\n"
                      "4. If you fail to recording that match so you can check our YouTube channel live streaming.\n"
                      "Contact our WhatsApp: +91-9735304489\n"
                      "Send all the details game No. player Name & ID No. screen recording and wait until 24 hours. Our official Team will check if your proof is right so we are bane that account and refund your money.",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRule(String ruleNumber, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$ruleNumber:",
          style: TextStyle(
              fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(fontSize: 13.sp, color: Colors.white),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
