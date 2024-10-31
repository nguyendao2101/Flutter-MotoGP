// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/legends_main_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_main_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_main_view.dart';
import 'package:get/get.dart';
import '../../../view_model/results_motogp_view_model.dart';
import '../../common/image_extention.dart';

class RidersAndTeamsMainView extends StatefulWidget {
  final int initialIndex;
  const RidersAndTeamsMainView({super.key, required this.initialIndex});

  @override
  State<RidersAndTeamsMainView> createState() => _RidersAndTeamsViewState();
}

class _RidersAndTeamsViewState extends State<RidersAndTeamsMainView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 5, vsync: this, initialIndex: widget.initialIndex);

    _tabController?.addListener(() {
      selectTab = _tabController?.index ?? 0;
      setState(() {});
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
            automaticallyImplyLeading: false, // Ẩn nút "back"
            expandedHeight: 120, // Chiều cao tùy chỉnh cho AppBar khi mở rộng
            floating: true, // Giúp AppBar cuộn theo nội dung
            snap: true, // AppBar biến mất ngay khi vuốt nhẹ lên
            pinned: false, // AppBar không giữ lại khi cuộn
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Color(0xFF3D0000)
                    ], // Các màu gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 20),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _textTopAppbar('Riders & Team'),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  ImageAssest.search,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 27,
                              left: -50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TabBar(
                                  controller: _tabController,
                                  indicatorColor: Colors.red,
                                  indicatorWeight: 6,
                                  labelColor: Colors.white,
                                  labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  isScrollable: true,
                                  tabs: const [
                                    Tab(text: 'RIDERS'),
                                    Tab(text: 'TEAMS'),
                                    Tab(text: 'LEGENDS'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                const RidersMainView(),
                const TeamsMainView(),
                LegendsMainView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _textTopAppbar(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
