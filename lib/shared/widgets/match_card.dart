import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MatchCard extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final String? homeScore;
  final String? awayScore;
  final String status; // "LIVE", "FT", "19:30", etc.
  final String league;
  final bool isLive;
  final VoidCallback? onTap;

  const MatchCard({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    this.homeScore,
    this.awayScore,
    required this.status,
    required this.league,
    this.isLive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isLive ? AppColors.primary.withOpacity(0.3) : AppColors.border,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // League + Status row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  league,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
                _StatusBadge(status: status, isLive: isLive),
              ],
            ),
            const Gap(14),

            // Teams + Score
            Row(
              children: [
                // Home team
                Expanded(
                  child: Text(
                    homeTeam,
                    style: AppTextStyles.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Score or time
                if (homeScore != null && awayScore != null) ...[
                  const Gap(12),
                  Text(
                    homeScore!,
                    style: AppTextStyles.scoreSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      '-',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ),
                  Text(
                    awayScore!,
                    style: AppTextStyles.scoreSmall,
                  ),
                  const Gap(12),
                ] else ...[
                  const Gap(16),
                ],

                // Away team
                Expanded(
                  child: Text(
                    awayTeam,
                    style: AppTextStyles.titleMedium,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

class _StatusBadge extends StatelessWidget {
  final String status;
  final bool isLive;

  const _StatusBadge({
    required this.status,
    required this.isLive,
  });

  @override
  Widget build(BuildContext context) {
    if (isLive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
            ),
            const Gap(5),
            Text(
              'LIVE',
              style: AppTextStyles.liveBadge,
            ),
          ],
        ),
      );
    }

    return Text(
      status,
      style: AppTextStyles.labelMedium.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }
}
