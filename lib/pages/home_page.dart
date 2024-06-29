import 'package:flutter/material.dart';
import 'package:uts_app/components/current_path.dart';
import 'package:uts_app/components/description_box.dart';
import 'package:uts_app/components/drawer.dart';
import 'package:uts_app/components/sliver_app_bar.dart';
import 'package:uts_app/components/tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          AppSliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // current path
                const MyCurrentPath(),

                // box deskripsi
                const DescriptionBox(),
              ],
            ),
          )
        ],
        body: Container(color: Colors.blue),
      ),
    );
  }
}
