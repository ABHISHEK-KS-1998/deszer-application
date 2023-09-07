import 'package:deszer_application1/pages/account/account_page.dart';
import 'package:deszer_application1/pages/auth/sign_up_page.dart';
import 'package:deszer_application1/pages/cart/cart_history.dart';
import 'package:deszer_application1/pages/home/main_cake_page.dart';
import 'package:deszer_application1/utlis/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../auth/sign_in_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  late PersistentTabController _controller;



  List pages=[
    MainCakePage(),
    SignUpPage(),
    CartHistory(),
    AccountPage(),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndex=index;
    });
  }
  //@override
  /*void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }*/

 /* List<Widget> _buildScreens() {
    return [
      MainCakePage(),
      Container(child:Center(child:Text('Next Page'))),
      Container( child:Center(child:Text('Next next Page'))),
      Container(child:Center(child:Text('Next next next Page'))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("archive"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex], //find why it is used
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.maincolor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
       currentIndex: _selectedIndex,
        onTap: onTapNav,
        items:   [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
            label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive,),
            label: 'history'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
            label: 'cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: 'profile'
          ),
        ],
      ),
    );
  }
 /* Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
       screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }*/
}