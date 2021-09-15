import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';
import 'package:flutter_meditaion_demo/pages/home/home.dart';
import 'package:flutter_meditaion_demo/pages/mainHomePage/widgets/draggable_player_sheet.dart';
import 'package:flutter_meditaion_demo/pages/profile/profile_widget.dart';
import 'package:flutter_meditaion_demo/pages/saved/saved_widget.dart';
import 'package:flutter_meditaion_demo/pages/seeAll/see_all_widget.dart';
import 'package:flutter_meditaion_demo/valueNotifier/draggable_sheet_notifier.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentWidgetPos = 0;

  @override
  void initState() {
    super.initState();
    getIt<PageManager>().init();
  }

  List<Widget> listWidgets = [
    const HomePageWidget(),
    const SeeAllWidget(),
    const SavedWidget(),
    const ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: _currentWidgetPos == 0 ? Theme.of(context).primaryColor : Colors.white,
        statusBarIconBrightness: _currentWidgetPos == 0 ? Brightness.light : Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: _buildMainBody(),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildMainBody() {
    return Stack(children: [
      listWidgets[_currentWidgetPos],
      _buildDraggableView(),
    ]);
  }

  Widget _buildDraggableView() {
    var height = MediaQuery.of(context).size.height;
    height = height - 80;
    return DraggablePlayerSheet(height: height);
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentWidgetPos,
      elevation: 5,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_florist_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '',
        ),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontSize: 0),
      unselectedLabelStyle: const TextStyle(fontSize: 0),
      iconSize: 28,
      onTap: (index) {
        setState(() {
          _currentWidgetPos = index;
        });
      },
    );
  }

  @override
  void dispose() {
    getIt<PageManager>().dispose();
    getIt<DraggableSheetNotifier>().draggableExpansionValueNotifier.dispose();
    getIt<DraggableSheetNotifier>().draggableIsOpenValueNotifier.dispose();
    super.dispose();
  }
}
