import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/match_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FootyFly',
                          style: AppTextStyles.displayMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          'Today\'s Matches',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _IconButton(
                          icon: Icons.search_rounded,
                          onTap: () {},
                        ),
                        const Gap(8),
                        _IconButton(
                          icon: Icons.notifications_none_rounded,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Live section header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      'LIVE NOW',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.primary,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Live matches
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  MatchCard(
                    homeTeam: 'Manchester City',
                    awayTeam: 'Arsenal',
                    homeScore: '2',
                    awayScore: '1',
                    status: "67'",
                    league: 'Premier League',
                    isLive: true,
                  ),
                  MatchCard(
                    homeTeam: 'Real Madrid',
                    awayTeam: 'Barcelona',
                    homeScore: '0',
                    awayScore: '0',
                    status: "23'",
                    league: 'La Liga',
                    isLive: true,
                  ),
                ],
              ),
            ),

            // Upcoming section
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 28, 20, 12),
                child: Text(
                  'UPCOMING',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTertiary,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
            ),

            // Upcoming matches
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  MatchCard(
                    homeTeam: 'Liverpool',
                    awayTeam: 'Chelsea',
                    status: '19:30',
                    league: 'Premier League',
                  ),
                  MatchCard(
                    homeTeam: 'Bayern Munich',
                    awayTeam: 'Dortmund',
                    status: '20:30',
                    league: 'Bundesliga',
                  ),
                  MatchCard(
                    homeTeam: 'PSG',
                    awayTeam: 'Marseille',
                    status: '21:00',
                    league: 'Ligue 1',
                  ),
                  MatchCard(
                    homeTeam: 'Inter',
                    awayTeam: 'Juventus',
                    status: '20:45',
                    league: 'Serie A',
                  ),
                ],
              ),
            ),

            // Bottom padding
            const SliverToBoxAdapter(
              child: Gap(40),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_rounded),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_rounded),
              label: 'Standings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(
          icon,
          color: AppColors.textPrimary,
          size: 22,
        ),
      ),
    );
  }
}
