import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_moto2_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_moto3_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_motoe_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_motogp_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_moto2_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_moto3_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_motoe_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_motogp_view.dart';
import 'package:get/get.dart';

import '../../../view_model/results_motogp_view_model.dart';


class TeamsMainView extends StatefulWidget {
  const TeamsMainView({super.key});

  @override
  State<TeamsMainView> createState() =>
      _RidersAndTeamsRidersViewState();
}

class _RidersAndTeamsRidersViewState extends State<TeamsMainView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 4 tabs
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(RidersAndTeamsViewModels());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false, // Ẩn nút "back"
            floating: true, // Giúp AppBar cuộn theo nội dung
            snap: true, // AppBar xuất hiện ngay khi người dùng vuốt nhẹ lên
            pinned: false, // Không giữ lại AppBar khi cuộn
            primary: false, // Vô hiệu hóa việc tính toán AppBar với phần đầu
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              background: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.red,
                        indicatorWeight: 1,
                        labelColor: Colors.red,
                        labelStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        isScrollable: true,
                        tabs: const [
                          Tab(text: 'MotoGP™'),
                          Tab(text: 'Moto2™'),
                          Tab(text: 'Moto3™'),
                          Tab(text: 'MotoE™'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
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
}
