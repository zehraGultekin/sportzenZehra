import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/widgets/custom_snack_bar.dart';
import 'package:sportzenzehra/feature/home/view/enums/planner_mode.dart';
import 'package:sportzenzehra/feature/home/view/enums/player_status.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/create_match_modal.dart';

class PlayerCard extends StatelessWidget {
  final int rank;
  final String name;
  final PlayerStatus status;
  final Color? rankColor;

  const PlayerCard({
    super.key,
    required this.rank,
    required this.name,
    required this.status,
    required this.rankColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: status.isClick
          ? () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: CreateMatchModal(
                      mode: PlannerMode.create,
                      playerName: name,
                    ),
                  );
                },
              );
            }
          : () {
              const String errorMessage = 'Bu oyuncuya maç teklifi yapıılmaz';
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),

                content: CustomSnackBar(
                  message: errorMessage,
                  iconColor: theme.colorScheme.error,
                  borderColor: theme.colorScheme.error,
                ),
                duration: Duration(seconds: 5),
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },

      child: SizedBox(
        height: 60,
        width: 150,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: status.cardColor(context),
                borderRadius: BorderRadius.circular(8),
                border: status.getBorder(context),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: status.getTextColor(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    rank.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: rankColor ?? Colors.black,
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
