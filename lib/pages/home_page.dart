import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/pages/chat_page.dart';
import 'package:cocos_game/pages/game_page.dart';
import 'package:cocos_game/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 1;
  late PageController _pageController;
  late final List<String> tabs;
  String? appBarTitle;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      tabs = [
        S.of(context).global_chat,
        S.of(context).games,
        S.of(context).profile
      ];
      appBarTitle = tabs[_currentIndex];
    });

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Theme.of(context).primaryColor.withOpacity(0.5),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Center(
            child: Text(appBarTitle ?? S.of(context).games,
            style: Theme.of(context).textTheme.headline1,
            )
        ),
      ),

      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              appBarTitle = tabs[index];
            });
          },
          children: <Widget>[
            ChatPage(),
            GamePage(),
            ProfilePage(),
          ],
        ),
      ),

       bottomNavigationBar:
      GNav(
          rippleColor: Theme.of(context).accentColor.withOpacity(0.3),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          selectedIndex: _currentIndex,
          hoverColor: Theme.of(context).primaryColor.withOpacity(0.5), // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 1,
          curve: Curves.linear, // tab animation curves
          duration: Duration(milliseconds: 200), // tab animation duration
          gap: 5, // the tab button gap between icon and text
          color: Theme.of(context).primaryColor, // unselected icon color
          activeColor: Theme.of(context).accentColor, // selected icon and text color
          backgroundColor: Theme.of(context).backgroundColor,
          iconSize: 26, // tab button icon size
          tabBackgroundColor: Theme.of(context).backgroundColor, // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // navigation bar padding
          onTabChange: (index) => setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
            appBarTitle = tabs[index];
          }),
          tabs: [
            GButton(
              icon: CupertinoIcons.chat_bubble_2_fill,
              text: S.of(context).chat,
            ),
            GButton(
              icon: CupertinoIcons.game_controller_solid,
              text: S.of(context).games
            ),
            GButton(
              icon: Icons.home,
              text: S.of(context).profile
            )
          ],
      )
    );
  }
}

