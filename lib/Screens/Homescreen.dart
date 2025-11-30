import 'package:e_sports_app/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              //------------------ TOP ROW --------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/elo.png", width: 113, height: 38),
                  SizedBox(
                    width: 130,
                    height: 45,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/images/bgmi_border.png",
                            width: 136, height: 46, fit: BoxFit.fill),
                        Image.asset("assets/images/bgmi_logo.png",
                            width: 126, height: 36),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              //------------------ GAME MODE TABS --------------------
              _gameModeTabs(Provider.of<HomeProvider>(context)),

              const SizedBox(
                height: 20,
              ),

              //------------------ ESPORTS + REGISTERED MATCHES --------------------
              _sectionTabs(),

              const SizedBox(height: 0),
              Container(height: 1, color: Colors.white12),
              const SizedBox(height: 15),

              //------------------ GAME MODES TITLE ----------------
              const Text(
                "Game Modes",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              //------------------ GAME MODES IMAGE RESTORED ----------------
              Image.asset(
                "assets/images/game_modes.png",
                height: 58,
                width: 390,
                fit: BoxFit.fill,
              ),

              const SizedBox(height: 15),

              //------------------ MATCH DATE ----------------
              _matchDateText(),

              const SizedBox(height: 15),

              //------------------ BIG MATCH BANNER ----------------
              Image.asset("assets/images/big_match.png",
                  height: 169, width: 367, fit: BoxFit.cover),

              const SizedBox(height: 12),

              //------------------ MATCH DETAILS ----------------
              _matchDetailsText(),

              const SizedBox(height: 30),

              //------------------ SOLO / DUO / SQUAD --------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _modeBox("SOLO", imagePath: "assets/images/solo_icon.png"),
                  _modeBox("DUO", imagePath: "assets/images/duo_icon.png"),
                  _modeBox("SQUAD", imagePath: "assets/images/squad_icon.png"),
                ],
              ),

              const SizedBox(height: 20),

              //------------------ MATCH DATE AGAIN ----------------
              _matchDateText(),

              const SizedBox(height: 15),

              Image.asset("assets/images/big_match2.png",
                  height: 169, width: 367, fit: BoxFit.cover),

              const SizedBox(height: 12),

              _matchDetailsText(),

              const SizedBox(height: 15),

              Image.asset("assets/images/Screenshot (84).png",
                  height: 67, width: 367, fit: BoxFit.contain),

              const SizedBox(height: 30),

              //------------------ MATCH 3 ----------------
              _matchDateText(),

              const SizedBox(height: 15),

              Image.asset("assets/images/big_match3.png",
                  height: 169, width: 367, fit: BoxFit.cover),

              const SizedBox(height: 12),

              _matchDetailsText(),

              const SizedBox(height: 15),

              Image.asset("assets/images/Screenshot (84).png",
                  height: 67, width: 370, fit: BoxFit.cover),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  //---------------- GAME MODE TABS ----------------
  Widget _gameModeTabs(HomeProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _tabItem("assets/images/arena.png", "Arena", 0, provider),
        _tabItem("assets/images/zenith.png", "Zenith\nLeague", 1, provider),
        _tabItem("assets/images/champ.png", "Championship", 2, provider),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Icon(Icons.more_vert, color: Colors.white, size: 20),
        ),
      ],
    );
  }

  Widget _tabItem(String icon, String title, int index, HomeProvider provider) {
    bool isSelected = provider.selectedGameMode == index;

    return Expanded(
      child: InkWell(
        onTap: () => provider.changeGameMode(index),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 34,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //---------------- ESPORTS / REGISTERED MATCHES ----------------
  Widget _sectionTabs() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Esports",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 8),
                SizedBox(
                    width: 2,
                    height: 12,
                    child: ColoredBox(color: Colors.white)),
                SizedBox(width: 8),
                Text(
                  "Registered Matches",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 2,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFED4A47),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //---------------- MATCH DATE TEXT ----------------
  Widget _matchDateText() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Match Date - Sun Oct 05 | 2:30pm",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            border: Border.all(color: Colors.white12),
            borderRadius: BorderRadius.circular(6),
          ),
          child:
              const Icon(Icons.help_outline, color: Colors.white54, size: 18),
        )
      ],
    );
  }

  //---------------- MATCH DETAILS TEXT + IMAGE ----------------
  Widget _matchDetailsText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BATTLE ROYALE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Erangle",
              style: TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ],
        ),
        Image.asset(
          "assets/images/t_logo.png",
          height: 37,
          width: 37,
          fit: BoxFit.contain,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "ENTRY FEES",
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "₹ 59 / player",
              style: TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }

  //---------------- BOTTOM NAV BAR ----------------
  Widget _bottomNavBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Color(0xFFED4A47), width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navBarItem("assets/images/vector.png", true, "esports"),
          _navBarItem("assets/images/search1.png", false, "search"),
          _navBarItem("assets/images/leaderboard.png", false, "leaderboard"),
          _navBarItem("assets/images/group.png", false, "group"),
          _navBarItem("assets/images/profile.png", false, "profile"),
        ],
      ),
    );
  }

  Widget _navBarItem(String imagePath, bool isSelected, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            isSelected ? const Color(0xFFED4A47) : Colors.white54,
            BlendMode.srcIn,
          ),
          child: Image.asset(imagePath, width: 24, height: 24),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ---------------- SOLO/DUO/SQUAD BOX ----------------
Widget _modeBox(String text, {required String imagePath}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    decoration: BoxDecoration(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Image.asset(imagePath, width: 18, height: 18),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
