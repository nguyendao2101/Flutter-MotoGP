import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/view/home_view.dart';
import 'package:flutter_moto_gp/view/more_view.dart';
import 'package:flutter_moto_gp/view/results_view.dart';
import 'package:flutter_moto_gp/view/user_view.dart';
import 'package:flutter_moto_gp/view/watch_view.dart';
import 'package:flutter_moto_gp/view_model/main_screen_view_model.dart';
import 'package:get/get.dart';

import '../widgets/common/color_extentionn.dart';
import '../widgets/common/image_extention.dart';
import 'calendar_view.dart';

class MainScreenUserView extends StatefulWidget {
  const MainScreenUserView({super.key});

  @override
  State<MainScreenUserView> createState() => _HomeUserViewState();
}

class _HomeUserViewState extends State<MainScreenUserView>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(MainScreenViewModel());
  TabController? tabController;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);

    tabController?.addListener(() {
      selectTab = tabController?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('     '),
            Image.asset(ImageAssest.logoappMoto, height: 35,),
            InkWell(
              onTap: (){
                Get.to(() => const InfoUserView());
              },
                child: Image.asset(ImageAssest.helmet, height: 30,)),
          ],
        ),
      ),
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: tabController,
        children: [
          HomeView(),
          WatchView(),
          CalendarView(),
          ResultsView(),
          MoreView()
        ],
      ),
      bottomNavigationBar: Stack(children: [
        Container(
          height: 64,
          decoration: BoxDecoration(color: Colors.white, boxShadow: const [
            BoxShadow(
                color: Colors.black38, blurRadius: 5, offset: Offset(0, -3))
          ]),
          child: BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child: TabBar(
              controller: tabController,
              indicator: const BoxDecoration(), // Tắt hoàn toàn chỉ báo
              indicatorColor: Colors.white, // Làm cho chỉ báo không nhìn thấy
              labelColor: const Color(0xFF720303),
              labelStyle: const TextStyle(fontSize: 10),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(fontSize: 10),

              tabs: [
                Tab(
                  text: 'Home',
                  icon: Image.asset(
                    selectTab == 0 ? ImageAssest.home : ImageAssest.homeUn,
                    width: 24,
                    height: 24,
                  ),
                ),
                Tab(
                  text: 'Watch',
                  icon: Image.asset(
                    selectTab == 1 ? ImageAssest.play : ImageAssest.playUn,
                    width: 24,
                    height: 24,
                  ),
                ),
                Tab(
                  text: 'Calendar',
                  icon: Image.asset(
                    selectTab == 2 ? ImageAssest.flag : ImageAssest.flagUn,
                    width: 24,
                    height: 24,
                  ),
                ),
                Tab(
                  text: 'Results',
                  icon: Image.asset(
                    selectTab == 3 ? ImageAssest.result : ImageAssest.resultUn,
                    width: 24,
                    height: 24,
                  ),
                ),
                Tab(
                  text: 'More',
                  icon: Image.asset(
                    selectTab == 4 ? ImageAssest.more : ImageAssest.moreUn,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 14,
            color: Colors.white, // Màu sắc của đường
          ),
        ),
      ],),
    );
  }
}
