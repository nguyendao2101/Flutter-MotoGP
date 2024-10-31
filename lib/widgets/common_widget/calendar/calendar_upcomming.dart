import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/calendar/calendar_list_view_upcomming.dart';
import 'package:get/get.dart';

import '../../../view_model/calendar_view_model.dart';
import '../../common/image_extention.dart';

class CalendarUpcomming extends StatefulWidget {
  const CalendarUpcomming({super.key});

  @override
  State<CalendarUpcomming> createState() => _CalendarAllEventsFbState();
}

class _CalendarAllEventsFbState extends State<CalendarUpcomming> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarViewModel());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchAllEventsFebruary(),
              controller.fetchAllEventsMarch(),
              controller.fetchAllEventsApril(),
              controller.fetchAllEventsMay(),
              controller.fetchAllEventsJune(),
              controller.fetchAllEventsJuly(),
              controller.fetchAllEventsAugust(),
              controller.fetchAllEventsSeptember(),
              controller.fetchAllEventsOctober(),
              controller.fetchAllEventsNovember(),
              controller.fetchAllEventsNovemberTest(),
              controller.fetchAddCalendarAllEvents(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('November'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsNovember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCard(
                    controller: controller,
                    listDS: controller.allEventsNovember,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _grandsPrixMonth(String text) {
    return Row(
      children: [
        Image.asset(ImageAssest.redFlag, height: 28),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
