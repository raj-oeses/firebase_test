import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/feature/add_item_page/pages/add_item_page.dart';
import 'package:test_project/feature/home_page/pages/home_page.dart';
import 'package:test_project/feature/landing_page/presentation/presentation/components/drawer.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  //State class
  int _page = 0;
  late List<Widget Function()> screens;
  late GlobalKey<CurvedNavigationBarState> _bottomNavigationKey;

  @override
  void initState() {
    super.initState();
    _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
    screens = [
      () => const AddItemPage(),
      () => const Center(child: Text('home2')),
      () => const Center(child: Text('home3'))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        body: screens[_page](),
        appBar: AppBar(title: Text('')),
        bottomNavigationBar: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 200),
            backgroundColor: Colors.transparent,
            color: AppColors.grey400,
            key: _bottomNavigationKey,
            items: const <Widget>[
              Icon(Icons.add, size: 30),
              Icon(Icons.compare_arrows, size: 30),
              Icon(Icons.list, size: 30)
            ],
            onTap: (index) => setState(() => _page = index)));
  }
}
