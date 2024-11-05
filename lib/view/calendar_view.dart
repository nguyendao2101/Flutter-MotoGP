// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/calendar/calendar_finished.dart';
import 'package:flutter_moto_gp/widgets/common_widget/calendar/calendar_upcomming.dart';
import 'package:get/get.dart';

import '../view_model/calendar_view_model.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedTabIndex = 0; // Biến để theo dõi tab được chọn

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Thêm listener để cập nhật selectedTabIndex khi tab được thay đổi
    _tabController?.addListener(() {
      setState(() {
        _selectedTabIndex =
            _tabController!.index; // Cập nhật chỉ số tab được chọn
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
    final controller = Get.put(CalendarViewModel());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 10, // Chiều cao tối đa của SliverAppBar
            pinned: true, // Giữ lại trên đầu khi cuộn lên
            automaticallyImplyLeading: false,
            flexibleSpace: Stack(
              children: [
                Container(
                  color: Colors.white, // Màu nền cho SliverAppBar
                ),
                Positioned(
                  top: 0, // Điều chỉnh khoảng cách từ đầu
                  left: 0,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.red,
                    indicatorWeight: 3,
                    labelColor: Colors.red,
                    labelStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: ElevatedButton(
                          onPressed: () {
                            _tabController
                                ?.animateTo(0); // Chuyển đến tab đầu tiên
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: _selectedTabIndex == 0
                                ? Colors.white // Màu khi tab 1 được chọn
                                : Colors.black,
                            backgroundColor: _selectedTabIndex == 0
                                ? Colors.black // Màu khi tab 1 được chọn
                                : Colors.white, // Màu khi tab 1 không được chọn
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 2,
                            ),
                          ),
                          child: const Text('UPCOMING'),
                        ),
                      ),
                      Tab(
                        child: ElevatedButton(
                          onPressed: () {
                            _tabController
                                ?.animateTo(1); // Chuyển đến tab thứ hai
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: _selectedTabIndex == 1
                                ? Colors.white // Màu khi tab 1 được chọn
                                : Colors.black,
                            backgroundColor: _selectedTabIndex == 1
                                ? Colors.black // Màu khi tab 2 được chọn
                                : Colors.white, // Màu khi tab 2 không được chọn
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          child: const Text('FINISHED'),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 45, // Điều chỉnh khoảng cách từ đầu
                  left: 0,
                  right: 0, // Để kéo dài ra hết chiều ngang
                  child: Container(
                    height: 5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                CalendarUpcomming(),
                CalendarFinished(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
