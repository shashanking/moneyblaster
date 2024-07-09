import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/wallet/shared/provider.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:ff_moneyblaster/widgets/app_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class WithdrawBottomSheet extends ConsumerStatefulWidget {
  const WithdrawBottomSheet({
    super.key,
  });

  @override
  ConsumerState<WithdrawBottomSheet> createState() =>
      _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends ConsumerState<WithdrawBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _acNoController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  double? amountSelected;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(walletProvider.notifier);
    final state = ref.read(walletProvider);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final uid = auth.currentUser!.uid;

    final List<String> withdrawLabels = [
      '100',
      '200',
      '500',
      '1000',
      '2500',
      '5000',
    ];

    void pickAmount(double amount) {
      setState(() {
        if (amountSelected != amount) {
          amountSelected = amount;
        } else {
          amountSelected = null;
        }
      });
    }

    // Calculate remaining available height after subtracting bottom view inset
    // final screenHeight = MediaQuery.of(context).size.height;
    // final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    // final remainingHeight = screenHeight - bottomInset;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            // height: 75.h,
            decoration: customDecoration.copyWith(
                color: AppColors.popUpColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 1 title and x
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Withdraw Money",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.maybePop();
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: List.generate(6, (index) {
                        final isSelected =
                            amountSelected == int.parse(withdrawLabels[index]);
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: 4.0, right: 8.0),
                          child: GestureDetector(
                              onTap: () => pickAmount(
                                    double.parse(withdrawLabels[index]),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                  color: isSelected
                                      ? Colors.green[800]
                                      : Colors.green[400],
                                ),
                                child: Text(
                                  '₹ ${withdrawLabels[index]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                              // Chip(
                              //   shape: const StadiumBorder(),
                              //   side: BorderSide.none,
                              //   materialTapTargetSize:
                              //       MaterialTapTargetSize.shrinkWrap,
                              //   backgroundColor:
                              //       isSelected ? Colors.amber : Colors.green,
                              //   label: Text(
                              //     '₹ ${withdrawLabels[index]}',
                              //     style: const TextStyle(
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.w400,
                              //     ),
                              //   ),
                              // ),
                              ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      hintText: "Account Number",
                      controller: _acNoController,
                      keyboardType: TextInputType.number,
                      title: "Enter Account Number",
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    AppTextField(
                      hintText: "IFSC Code",
                      controller: _ifscController,
                      title: "Enter IFSC Code",
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    AppTextField(
                      hintText: "Full Name",
                      controller: _nameController,
                      title: "Enter Full Name",
                    ),

                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // AppTextField(
                    //   hintText: "Withdraw Amount",
                    //   controller: _amountController,
                    //   keyboardType: TextInputType.number,
                    //   title: "Enter Withdraw Amount",
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_nameController.text.isNotEmpty &&
                            _acNoController.text.isNotEmpty &&
                            _ifscController.text.isNotEmpty &&
                            amountSelected != 0 &&
                            state.user!.wallet.balance >
                                num.parse(amountSelected.toString())) {
                          await notifier.requestWithdraw(
                            context,
                            name: _nameController.text,
                            accountNo: _acNoController.text,
                            ifscCode: _ifscController.text,
                            amount: amountSelected!,
                          );
                          await notifier.fetchUserDetails();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Invalid Form Data',
                              ),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                        if (context.mounted) {
                          context.maybePop();
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
                          child: Text(
                            'Proceed',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
