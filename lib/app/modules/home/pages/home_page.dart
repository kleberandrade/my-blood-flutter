import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/campaigns/pages/campaign_page.dart';
import 'package:my_blood/app/modules/faq/pages/faq_page.dart';
import 'package:my_blood/app/modules/locations/pages/location_page.dart';
import 'package:my_blood/app/modules/profile/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;

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
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildBody() {
    return SizedBox.expand(
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[
          ProfilePage(),
          CampaignPage(),
          LocationPage(),
          FaqPage(),
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      onItemSelected: (index) {
        setState(() => _currentIndex = index);
        _pageController.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          title: Text('Doador'),
          icon: Icon(Icons.person),
          activeColor: Theme.of(context).accentColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          title: Text('Campanhas'),
          icon: Icon(Icons.apps),
          activeColor: Theme.of(context).accentColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          title: Text('Locais'),
          icon: Icon(Icons.local_hospital),
          activeColor: Theme.of(context).accentColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          title: Text('Dúvidas'),
          icon: Icon(Icons.question_answer),
          activeColor: Theme.of(context).accentColor,
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }
}
