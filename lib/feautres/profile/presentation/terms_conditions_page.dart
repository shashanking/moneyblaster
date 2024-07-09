// Adjust the path as necessary

import 'package:ff_moneyblaster/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermsConditionsPage extends ConsumerWidget {
  const TermsConditionsPage({Key? key}) : super(key: key);

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
                          'TERMS & CONDITIONS',
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
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms and Conditions for Money Blaster Tournament Application:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '1. Eligibility:\n'
                      'Participants must meet the age 18 year old and residency requirements specified in their respective jurisdictions to participate in Money Blaster Tournament.\n'
                      'Players must adhere to the rules and regulations of the games (PUBG and FF) as outlined by the game developers.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2. Entry Fee:\n'
                      '• All players must pay the designated entry fee to participate in the tournament.\n'
                      'Entry fees are non-refundable, and failure to join the tournament on time will result in forfeiture of the entry fee.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '3.  Fair Play:\n'
                      '• The use of hacks, cheats, or any form of unfair advantage is strictly prohibited.\n'
                      'Players found to be engaging in unfair practices will be banned from the tournament, and their accounts will be suspended pending investigation.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '4.  Account Suspension:\n'
                      'Any complaints regarding player conduct or suspected cheating will result in the immediate suspension of the accused player\'s account.\n'
                      '• Our team will conduct a thorough investigation within 24 hours. If found innocent, the account suspension will be lifted.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '5.  Live Streaming:\n'
                      'All tournament matches will be live- streamed on our official YouTube channel for transparency and entertainment purposes.\n',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '6.   Withdrawal Policy:\n'
                      '• Withdrawals can be made between 10:00 AM and 8:00 PM daily, except on major bank holidays, where the withdrawal processing time extends to 48 hours.\n'
                      '• The minimum withdrawal amount is 150 INR, and the maximum is 10000 INR per day',
                      style: TextStyle(fontSize: 16),
                    ),
                    // Add other terms as needed
                    SizedBox(height: 16),
                    Text(
                      '7. Technical Faults:\n'
                      'In the event of a match being halted due to technical faults or issues on our end, the entry fee will be refunded to the players\' accounts.\n'
                      '• Refunds will be processed promptly, and players will be notified accordingly.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '8. General:\n'
                      'Money Blaster Tournament reserves the right to amend the terms and conditions at any time without prior notice.\n'
                      'Participants are responsible for ensuring they have the necessary equipment and internet connection to participate in the tournament.\n'
                      'By participating in Money Blaster Tournament, players agree to abide by all rules and regulations outlined in these terms and conditions.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
