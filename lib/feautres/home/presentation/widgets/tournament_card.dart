import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:clipboard/clipboard.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/core/utils/toast.dart';
import 'package:ff_moneyblaster/feautres/base/shared/providers.dart';
import 'package:ff_moneyblaster/feautres/home/domain/tournament.dart';
import 'package:ff_moneyblaster/feautres/home/shared/provider.dart';
import 'package:ff_moneyblaster/feautres/wallet/shared/provider.dart';
import 'package:ff_moneyblaster/routes/app_router.gr.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

enum GameState {
  ongoing,
  upcoming,
  past,
}

class TournamentCard extends ConsumerStatefulWidget {
  const TournamentCard(
      {super.key,
      required this.gameState,
      required this.bal,
      required this.tournament,
      required this.isLessThan24Hours});

  final GameState gameState;
  final num bal;
  final Tournament tournament;
  final bool isLessThan24Hours;

  @override
  ConsumerState<TournamentCard> createState() => _TournamentCardState();
}

class _TournamentCardState extends ConsumerState<TournamentCard> {
  Duration _duration = Duration.zero;

  @override
  void initState() {
    if (widget.isLessThan24Hours) {
      _updateDuration();
      Timer.periodic(const Duration(seconds: 1), (_) => _updateDuration());
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});

    super.initState();
  }

  _launchURL(String address) async {
    if (Platform.isIOS) {
      final url = Uri.parse(address);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      final url = Uri.parse(address);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  void _updateDuration() {
    final now = DateTime.now();
    final remaining = widget.tournament.dateTime!.difference(now);
    _duration = remaining.isNegative ? Duration.zero : remaining;
    if (mounted) {
      setState(() {
        // widget.tournament.registeredPlayersId.contains(authState)
      });
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes % 60);
    final seconds = twoDigits(duration.inSeconds % 60);
    return "$hours.$minutes.$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(homeProvider.notifier);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final walletState = ref.read(walletProvider);
    final uid = auth.currentUser!.uid;
    final kGameOption = widget.tournament.gameOption;
    final kTotalPlayer = widget.tournament.registeredPlayersId.length;
    final kGameType = widget.tournament.gameType!.teamOption;

    final roomNotFull = kGameType == 'SOLO'
        ? (kTotalPlayer < widget.tournament.totalPlayersAllowed!)
        : kGameType == 'TDM'
            ? (kTotalPlayer < 2)
            : (kGameType == 'SQUAD' && kGameOption == 'BGMI')
                ? (kTotalPlayer < 24)
                : (kTotalPlayer < 12);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        width: 100,
        height: 220,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 10.6,
              color: Color(0x3F4AE5E5),
              offset: Offset(
                0,
                0,
              ),
            )
          ],
          gradient: const LinearGradient(
            colors: [
              Color(0x7FFFFFFF),
              Color(0x00FFFFFF),
              Color(0x00FFFFFF),
              Color(0x80FFFFFF)
            ],
            stops: [0, 0.1, 0.9, 1],
            begin: AlignmentDirectional(-0.34, -1),
            end: AlignmentDirectional(0.34, 1),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0x7F000000), Colors.black],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Opacity(
                    opacity: 0.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Visibility(
                        visible: (widget.tournament.bgImage == null ||
                            widget.tournament.bgImage.toString().isEmpty),
                        replacement: Image.network(
                          widget.tournament.bgImage!,
                          fit: BoxFit.cover,
                        ),
                        child: Image.asset(
                          widget.tournament.gameOption == "BGMI"
                              ? 'assets/images/home_card_bg_pubg.png'
                              : 'assets/images/home_card_bg_ff.png',
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tournament.tournamentName!,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prize Pool',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFFB6B6B6),
                                    fontSize: 10,
                                    letterSpacing: 0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 0, 0, 0),
                              child: Text(
                                'Rs. ${widget.tournament.prizePool?[0] ?? ""}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 10,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            '${widget.tournament.gameType?.gameCamera} . ${widget.tournament.gameType?.gameMap} . ${widget.tournament.gameType?.teamOption}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFFB6B6B6),
                                  fontSize: 10,
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: widget.gameState == GameState.ongoing
                        ? Row(
                            children: [
                              Visibility(
                                visible: widget.tournament.liveLink
                                    .toString()
                                    .isNotEmpty,
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: InkWell(
                                      onTap: () {
                                        if (widget.tournament.liveLink
                                            .toString()
                                            .isNotEmpty) {
                                          _launchURL(
                                              widget.tournament.liveLink!);
                                        } else {
                                          showToastMessage('No Link Provided');
                                        }
                                      },
                                      child: buildButton(
                                          context,
                                          'Watch Live',
                                          const Color(0xFFCF3A3A),
                                          const Color(0xFF9D0000)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : widget.gameState == GameState.past
                            ? Row(
                                children: [
                                  widget.tournament.liveLink != null
                                      ? Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: GestureDetector(
                                              onTap: () {
                                                _launchURL(widget
                                                    .tournament.liveLink!);
                                              },
                                              child: buildButton(
                                                  context,
                                                  'Watch',
                                                  const Color(0xFFCF3A3A),
                                                  const Color(0xFF9D0000)),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: GestureDetector(
                                        onTap: () {
                                          // sent to reslut page
                                          context.pushRoute(ResultScreen(
                                              result: widget.tournament.result,
                                              title: widget
                                                  .tournament.tournamentName!));
                                        },
                                        child: buildButton(
                                            context,
                                            'Result',
                                            const Color(0xFF0051EF),
                                            const Color(0xFF0051EF)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  widget.tournament.liveLink != null
                                      ? Visibility(
                                          visible: widget.tournament.liveLink
                                              .toString()
                                              .isNotEmpty,
                                          child: Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _launchURL(widget
                                                      .tournament.liveLink!);
                                                },
                                                child: buildButton(
                                                  context,
                                                  'Watch Live',
                                                  const Color(0xFFCF3A3A),
                                                  const Color(0xFF9D0000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  if (roomNotFull)
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (walletState
                                                  .user?.gameStats.game ==
                                              widget.tournament.gameOption) {
                                            await notifier.selectTournament(
                                                widget.tournament);
                                            final notifierWallet = ref
                                                .read(walletProvider.notifier);
                                            await notifierWallet
                                                .fetchUserDetails();
                                            walletState.isLoading == false
                                                ? showModalBottomSheet<void>(
                                                    backgroundColor:
                                                        AppColors.glassColor,
                                                    barrierColor:
                                                        const Color.fromRGBO(
                                                            7, 7, 7, 0.7),
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return (walletState
                                                                      .user!
                                                                      .wallet
                                                                      .balance >=
                                                                  widget
                                                                      .tournament
                                                                      .entryFee! ||
                                                              widget.tournament
                                                                  .registeredPlayersId
                                                                  .contains(walletState
                                                                      .user
                                                                      ?.id))
                                                          ? JoinTournamamentWidget(
                                                              bal: widget.bal,
                                                              tournament: widget
                                                                  .tournament,
                                                            )
                                                          : DepositBeforeJoining(
                                                              balance:
                                                                  walletState
                                                                      .user!
                                                                      .wallet
                                                                      .balance,
                                                              tournament: widget
                                                                  .tournament);
                                                    },
                                                  )
                                                : const CircularProgressIndicator();
                                          } else {
                                            Fluttertoast.showToast(
                                                    msg:
                                                        'You can Join ${walletState.user?.gameStats.game} games only')
                                                .then((value) =>
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Register new account with ${widget.tournament.gameOption} Game'));
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: buildButton(
                                              context,
                                              widget.tournament
                                                      .registeredPlayersId
                                                      .contains(uid)
                                                  ? 'Get Details'
                                                  : 'Join',
                                              const Color(0xFF11BDBD),
                                              const Color(0xFF006262)),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: (widget.tournament.perKill != null &&
                            widget.tournament.perKill != 0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 4, 4, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Per Kill: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 10,
                                        letterSpacing: 0,
                                      ),
                                ),
                                Text(
                                  '₹${widget.tournament.perKill}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0x67B70000),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(4),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(4),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Entry Fee: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 10,
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                '₹${widget.tournament.entryFee}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 10,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0.45),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 68.w,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            color: Colors.orange,
                            minHeight: 6,
                            // semanticsLabel: 'asdfsdf',
                            value:
                                widget.tournament.gameType?.teamOption == 'SOLO'
                                    ? ((widget.tournament.registeredPlayersId
                                                .length /
                                            widget.tournament
                                                .totalPlayersAllowed!) *
                                        1)
                                    : widget.tournament.gameType?.teamOption ==
                                            'SQUAD'
                                        ? ((widget
                                                    .tournament
                                                    .registeredPlayersId
                                                    .length /
                                                12) *
                                            1)
                                        : ((widget
                                                    .tournament
                                                    .registeredPlayersId
                                                    .length /
                                                2) *
                                            1),
                            semanticsValue: widget
                                .tournament.registeredPlayersId.length
                                .toString(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Visibility(
                        visible:
                            widget.tournament.gameType?.teamOption == 'SOLO',
                        replacement: Container(
                          child: Text(
                            '${widget.tournament.registeredPlayersId.length.toString()}/${widget.tournament.gameType?.teamOption == 'TDM' ? '2' : widget.tournament.gameOption == 'BGMI' ? '24' : '12'} Slots',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        child: Container(
                          child: Text(
                            '${widget.tournament.registeredPlayersId.length.toString()}/${widget.tournament.totalPlayersAllowed} Slots',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Date: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 10,
                                    letterSpacing: 0,
                                  ),
                            ),
                            Text(
                              DateFormat('dd/MM/yy')
                                  .format(widget.tournament.dateTime!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 10,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          DateFormat('jm').format(widget.tournament.dateTime!),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1, 0),
                  child: widget.isLessThan24Hours
                      ? Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'MATCH STARTED',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: 'Oswald',
                                      color: Colors.white,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 0),
                                child: Text(
                                  formatDuration(_duration),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 1.6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 12,
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'HR',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 8,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                      'MIN',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 8,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                      'SEC',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 8,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(
      BuildContext context, String text, Color startColor, Color endColor) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          stops: const [0, 1],
          begin: const AlignmentDirectional(-1, 0),
          end: const AlignmentDirectional(1, 0),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

class JoinTournamamentWidget extends ConsumerStatefulWidget {
  final Tournament tournament;
  final num bal;
  const JoinTournamamentWidget({
    required this.tournament,
    required this.bal,
    super.key,
  });

  @override
  ConsumerState<JoinTournamamentWidget> createState() =>
      _JoinTournamamentWidgetState();
}

class _JoinTournamamentWidgetState
    extends ConsumerState<JoinTournamamentWidget> {
  final playerOneId = TextEditingController();
  final playerTwoId = TextEditingController();
  final playerThreeId = TextEditingController();
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateDuration();
    Timer.periodic(const Duration(seconds: 1), (_) => _updateDuration());
  }

  void _updateDuration() {
    final now = DateTime.now();
    final remaining = widget.tournament.dateTime!.difference(now);
    _duration = remaining.isNegative ? Duration.zero : remaining;
    if (mounted) {
      setState(() {});
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes % 60);
    final seconds = twoDigits(duration.inSeconds % 60);
    return "match starts in : $hours hr $minutes min $seconds sec";
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(homeProvider.notifier);
    final state = ref.read(homeProvider);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final uid = auth.currentUser!.uid;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                Assets.tournamentJoining,
                scale: 2,
              )),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: FractionallySizedBox(
              heightFactor: 1.35,
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    // height: widget.tournament.gameType?.teamOption == 'SOLO'
                    //     ? MediaQuery.of(context).size.height * 0.5
                    //     : MediaQuery.of(context).size.height * 0.6,
                    padding: const EdgeInsets.all(20),
                    decoration: customDecoration.copyWith(
                        color: AppColors.popUpColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1 title and x
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                widget.tournament.tournamentName ?? "",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
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
                          height: 12,
                        ),
                        // prize pool | per kill | entry fee
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Prize Pool',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  '₹${widget.tournament.prizePool?[0] ?? ""}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: AppColors.blue),
                                ),
                              ],
                            ),
                            if (widget.tournament.perKill != null) ...[
                              Container(
                                width: 1,
                                height: 50,
                                color: AppColors.glassColor,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Per Kill',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    '₹${widget.tournament.perKill}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ],
                            Container(
                              width: 1,
                              height: 50,
                              color: AppColors.glassColor,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Entry Fee',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  '₹${widget.tournament.entryFee}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // map details
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible:
                                  widget.tournament.gameType?.gameMap != null &&
                                      widget.tournament.gameType!.gameMap!
                                          .isNotEmpty,
                              child: Container(
                                // width: 66,
                                // height: 22,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                margin: const EdgeInsets.only(
                                  right: 8,
                                ),
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
                                      widget.tournament.gameType?.gameMap ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // width: 66,
                              // height: 22,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              margin: const EdgeInsets.only(
                                right: 8,
                              ),
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
                                    widget.tournament.gameType?.gameCamera ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // width: 66,
                              // height: 22,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              margin: const EdgeInsets.only(
                                right: 8,
                              ),
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
                                    widget.tournament.gameType?.teamOption ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // match starts in
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              formatDuration(_duration),
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                        if (widget.tournament.registeredPlayersId
                            .contains(uid)) ...[
                          const SizedBox(
                            height: 20,
                          ),
                          // match starts in
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Room ID',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    widget.tournament.lobby ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    FlutterClipboard.copy(
                                            widget.tournament.lobby ?? '')
                                        .then((value) => Fluttertoast.showToast(
                                            msg: 'Room ID Copied.'));
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // match starts in
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Room Password',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    widget.tournament.lobbyPassword ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    FlutterClipboard.copy(
                                            widget.tournament.lobby ?? '')
                                        .then((value) => Fluttertoast.showToast(
                                            msg: 'Room Password Copied.'));
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ],
                        //const Spacer(),
                        const SizedBox(
                          height: 32,
                        ),
                        // // player Id list details
                        if ((widget.tournament.gameType?.teamOption ==
                                'SQUAD' ||
                            widget.tournament.gameType?.teamOption == "TDM"))
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: customDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(8)),
                                child: TextFormField(
                                  controller: playerOneId,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Player 2 Game ID',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.3))),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: customDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(8)),
                                child: TextFormField(
                                  controller: playerTwoId,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Player 3 Game ID',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            color:
                                                Colors.white.withOpacity(0.3)),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: customDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(8)),
                                child: TextFormField(
                                  controller: playerThreeId,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Player 4 Game ID',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.3))),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),

                        // proceed
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You have ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text('₹${widget.bal.toStringAsFixed(2)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blue,
                                    )),
                            Text(
                              ' in your wallet',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (!widget.tournament.registeredPlayersId
                            .contains(FirebaseAuth.instance.currentUser!.uid))
                          GestureDetector(
                            onTap: () async {
                              if (widget.tournament.gameType?.teamOption ==
                                      "SQUAD" ||
                                  widget.tournament.gameType?.teamOption ==
                                      "TDM") {
                                if (playerOneId.text.isEmpty ||
                                    playerTwoId.text.isEmpty ||
                                    playerThreeId.text.isEmpty) {
                                  showToastMessage(
                                      'Please enter all player IDs');
                                  return;
                                }
                              }

                              // await notifier
                              //     .drawWallet(widget.tournament.entryFee!);

                              if (widget.tournament.gameType?.teamOption ==
                                      "SQUAD" ||
                                  widget.tournament.gameType?.teamOption ==
                                      "TDM") {
                                await notifier.registerForTournament(
                                  t: state.selectedTournament!,
                                  squadPlayerIds: [
                                    playerOneId.text,
                                    playerTwoId.text,
                                    playerThreeId.text,
                                  ],
                                ).then((value) async {
                                  context.maybePop();
                                });
                              } else {
                                await notifier
                                    .registerForTournament(
                                  t: state.selectedTournament!,
                                )
                                    .then((value) async {
                                  context.maybePop();
                                });
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
                                    ]),
                              ),
                              child: Center(
                                child: Text(
                                  'Pay ₹${widget.tournament.entryFee}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //     top: 100,
          //     child: Image.asset(
          //       Assets.tournamentJoining,
          //       scale: 2,
          //     )),
        ],
      ),
    );
  }
}

class DepositBeforeJoining extends ConsumerStatefulWidget {
  final Tournament tournament;
  final dynamic balance;
  const DepositBeforeJoining({
    required this.tournament,
    required this.balance,
    super.key,
  });

  @override
  ConsumerState<DepositBeforeJoining> createState() =>
      _DepositBeforeJoiningState();
}

class _DepositBeforeJoiningState extends ConsumerState<DepositBeforeJoining> {
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateDuration();
    Timer.periodic(const Duration(seconds: 1), (_) => _updateDuration());
  }

  void _updateDuration() {
    final now = DateTime.now();
    final remaining = widget.tournament.dateTime!.difference(now);
    _duration = remaining.isNegative ? Duration.zero : remaining;
    if (mounted) {
      setState(() {});
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes % 60);
    final seconds = twoDigits(duration.inSeconds % 60);
    return "match starts in : $hours hr $minutes min $seconds sec";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //     top: 0,
        //     right: 0,
        //     child: Image.asset(
        //       Assets.tournamentJoining,
        //       scale: 2,
        //     )),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
              // height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.all(20),
              decoration: customDecoration.copyWith(
                  color: AppColors.popUpColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1 title and x
                  const Spacer(),
                  Container(
                    width: 30.w,
                    height: 30.w,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 10)),
                    child: Image.asset(
                      Assets.walletDeposit,
                      color: AppColors.white,
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You need ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              // color: AppColors.blue,
                            ),
                      ),
                      Text(
                          '₹${widget.tournament.entryFee ?? 0 - widget.balance}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blue,
                                  )),
                      Text(
                        ' more to participate',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              // color: AppColors.blue,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      final notifier = ref.read(baseNotifierProvider.notifier);
                      context.maybePop();
                      notifier.tapBottomNavIndex(1);
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
                            ]),
                      ),
                      child: Center(
                        child: Text(
                          'Deposit',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        // Positioned(
        //     top: 100,
        //     child: Image.asset(
        //       Assets.tournamentJoining,
        //       scale: 2,
        //     )),
      ],
    );
  }
}
