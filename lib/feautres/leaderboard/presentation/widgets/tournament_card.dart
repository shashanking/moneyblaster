import 'package:flutter/material.dart';

enum GameState {
  ongoing,
  upcoming,
  past,
}

class TournamentCard extends StatefulWidget {
  const TournamentCard({super.key, required this.gameState});

  final GameState gameState;

  @override
  State<TournamentCard> createState() => _TournamentCardState();
}

class _TournamentCardState extends State<TournamentCard> {
  @override
  Widget build(BuildContext context) {
    return // Generated code for this CardTournament Widget...
        Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        width: 100,
        height: 180,
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
                      child: Image.network(
                        'https://s3-alpha-sig.figma.com/img/44dc/b1c3/adda462080a0ccdabe0649db20c8ccf2?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CVkJbpQklBNaXT1Qg3ZezJ-3xmfpADps6fYaODJ1vt3Z5jLDMZ~Iv8o4eZhop0s8Fn~w8almkyT~H3K7USkZ7ceqFELRdfr7LPA~u88pi2PuxpgZ8n9ZRNCLcTvN-VmXwKOKKLCKRPz6xL3GImhW-lvt4jYUc5Pz4eW35mX8giTpXMj-Ec0WQI6qmTPlvphSZJJuXTvQ2dEy4t2xQnRbqvD-ylwpbnreUJ~3SgVLz2TKmO2udT8zPLxXcdrGXsr0-x9lRJ-bvsnKZwrxuHvx7q5aikaFBsGOZzVLCy2HXmcC2sj88pDoJxVTkpd6IC4EtovAyRgMovUyFedj50mX~g__',
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
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
                          'BGMI Cash Cup',
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
                                'Rs. 3000',
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
                            'TPP . Sanhok . Squad',
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
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: buildButton(
                                      context,
                                      'Watch Live',
                                      const Color(0xFFCF3A3A),
                                      const Color(0xFF9D0000)),
                                ),
                              ),
                            ],
                          )
                        : widget.gameState == GameState.past
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: buildButton(
                                          context,
                                          'Result',
                                          const Color(0xFF0051EF),
                                          const Color(0xFF0051EF)),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: buildButton(
                                          context,
                                          'Watch Live',
                                          const Color(0xFFCF3A3A),
                                          const Color(0xFF9D0000)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: buildButton(
                                          context,
                                          'Join',
                                          const Color(0xFF11BDBD),
                                          const Color(0xFF006262)),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0.2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
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
                                '₹10',
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
                                '₹1000',
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
                  alignment: const AlignmentDirectional(1, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Date: ',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 10,
                                    letterSpacing: 0,
                                  ),
                        ),
                        Text(
                          '26/05/24',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 10,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'MATCH STARTED',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Oswald',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            '00.13.25',
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ),
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
