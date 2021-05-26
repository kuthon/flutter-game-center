import 'package:cocos_game/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Center(child: Text('HomePage', style: Theme.of(context).textTheme.headline1,)),
      ),

      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(color: Colors.blueGrey,),
            Container(color: Colors.red,),
            Container(color: Colors.green, child: TextButton(child: Text('da'), onPressed: ()=> AuthService().logOut(),),),
          ],
        ),
      ),

       bottomNavigationBar:
      GNav(
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
          onTabChange: (index) => setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
          }),
          tabs: [
            GButton(
              icon: CupertinoIcons.chat_bubble_2_fill,
              text: 'Chat',
            ),
            GButton(
              icon: CupertinoIcons.game_controller_solid,
              text: 'Games'
            ),
            GButton(
              icon: Icons.home,
              text: 'Profile'
            )
          ]
      )
    );
  }
}

