import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/results_main_view.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/standings_main_view.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({super.key});

  @override
  State<ResultsView> createState() => _ResultsAndStandingsViewState();
}

class _ResultsAndStandingsViewState extends State<ResultsView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0, // Tăng chiều cao để dễ nhìn hơn
            floating: true,
            snap: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.red,
                      indicatorWeight: 6,
                      labelColor: Colors.red,
                      labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      isScrollable: true,
                      tabs: const [
                        Tab(text: '          RESULTS           '),
                        Tab(text: '          STANDINGS          '),
                      ],
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
                ResultsMainView(),
                StandingsMainView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
