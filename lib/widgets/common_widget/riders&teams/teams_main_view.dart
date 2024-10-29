import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_moto2_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_moto3_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_motoe_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_motogp_view.dart';
import 'package:get/get.dart';

import '../../../view_model/results_motogp_view_model.dart';

class TeamsMainView extends StatefulWidget {
  const TeamsMainView({super.key});

  @override
  State<TeamsMainView> createState() => _TeamsMainViewState();
}

class _TeamsMainViewState extends State<TeamsMainView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController?.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RidersAndTeamsViewModels());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            snap: true,
            pinned: false,
            primary: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              background: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Positioned(
                    bottom: 0,
                    left: -60,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.white,
                        indicatorWeight: 1,
                        labelColor: Colors.red,
                        labelStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        isScrollable: true,
                        tabs: [
                          _buildTabButton(0, 'MotoGP™'),
                          _buildTabButton(1, 'Moto2™'),
                          _buildTabButton(2, 'Moto3™'),
                          _buildTabButton(3, 'MotoE™'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TeamsMotogpView(),
                TeamsMoto2View(),
                TeamsMoto3View(),
                TeamsMotoeView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String text) {
    return Tab(
      child: ElevatedButton(
        onPressed: () {
          _tabController?.animateTo(index);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: _selectedTabIndex == index
              ? Colors.white
              : Colors.black,
          backgroundColor: _selectedTabIndex == index
              ? Colors.red
              : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
