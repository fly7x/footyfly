import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDateIndex = 1; // Today

  final List<String> dates = ['Yesterday', 'Today', 'Tomorrow', 'Sat, 28 Nov'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildAppBar(),

            // Date Tabs
            _buildDateTabs(),

            // Main content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                children: [
                  // FOLLOWING SECTION (teams you follow appear first)
                  _buildSectionHeader('FOLLOWING', showIcon: true),
                  _buildFollowingMatch(
                    home: 'Manchester City',
                    away: 'Arsenal',
                    time: "67'",
                    isLive: true,
                    homeScore: '2',
                    awayScore: '1',
                  ),
                  _buildFollowingMatch(
                    home: 'Liverpool',
                    away: 'Chelsea',
                    time: '19:30',
                    isLive: false,
                  ),

                  const Gap(12),

                  // LEAGUE SECTIONS
                  _buildLeagueSection(
                    flag: '🇮🇹',
                    title: 'Italy - Serie A',
                    matches: [
                      _MatchData('Venezia', 'Bologna', '23:45'),
                    ],
                  ),
                  _buildLeagueSection(
                    flag: '🇩🇪',
                    title: 'Germany - Bundesliga',
                    matches: [
                      _MatchData('Werder Bremen', "M'gladbach", '23:30'),
                    ],
                  ),
                  _buildLeagueSection(
                    flag: '🇫🇷',
                    title: 'France - Ligue 1',
                    matches: [
                      _MatchData('Brest', 'Paris FC', '23:45'),
                    ],
                  ),
                  _buildLeagueSection(
                    flag: '🏆',
                    title: 'Europa League',
                    matches: [
                      _MatchData('Crystal Palace', 'Real Sociedad', '00:00'),
                      _MatchData('Ferencváros', 'NK Celje', '00:00'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          // Logo text (wing logo will be added as asset later)
          Text(
            'FootyFly',
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const Spacer(),

          // Live button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
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
                const Gap(6),
                Text(
                  'Live',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),

          // Calendar
          _roundIconButton(Icons.calendar_today_rounded),
          const Gap(8),

          // Menu
          _roundIconButton(Icons.menu_rounded),
        ],
      ),
    );
  }

  Widget _roundIconButton(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
      ),
      child: Icon(icon, size: 18, color: AppColors.textPrimary),
    );
  }

  Widget _buildDateTabs() {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedDateIndex;
          return GestureDetector(
            onTap: () => setState(() => selectedDateIndex = index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 2.5,
                  ),
                ),
              ),
              child: Text(
                dates[index],
                style: AppTextStyles.titleMedium.copyWith(
                  color: isSelected ? AppColors.textPrimary : AppColors.textTertiary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showIcon = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Row(
        children: [
          if (showIcon) ...[
            const Icon(Icons.star_rounded, size: 16, color: AppColors.primary),
            const Gap(6),
          ],
          Text(
            title,
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingMatch({
    required String home,
    required String away,
    required String time,
    required bool isLive,
    String? homeScore,
    String? awayScore,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: isLive
            ? Border.all(color: AppColors.primary.withOpacity(0.35))
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              home,
              style: AppTextStyles.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isLive && homeScore != null) ...[
            Text(homeScore, style: AppTextStyles.scoreSmall),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text('-', style: AppTextStyles.bodyMedium),
            ),
            Text(awayScore!, style: AppTextStyles.scoreSmall),
          ] else ...[
            Text(
              time,
              style: AppTextStyles.labelLarge.copyWith(
                color: isLive ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
          Expanded(
            child: Text(
              away,
              style: AppTextStyles.titleMedium,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeagueSection({
    required String flag,
    required String title,
    required List<_MatchData> matches,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // League header
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 12, 8),
            child: Row(
              children: [
                Text(flag, style: const TextStyle(fontSize: 16)),
                const Gap(8),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: AppColors.textTertiary,
                  size: 22,
                ),
              ],
            ),
          ),

          // Matches
          ...matches.map((m) => _buildLeagueMatch(m)),
        ],
      ),
    );
  }

  Widget _buildLeagueMatch(_MatchData match) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 6, 14, 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              match.home,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            match.time,
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Expanded(
            child: Text(
              match.away,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textTertiary,
        selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer_rounded),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_rounded),
            label: 'Leagues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_rounded),
            label: 'Following',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class _MatchData {
  final String home;
  final String away;
  final String time;

  _MatchData(this.home, this.away, this.time);
}
