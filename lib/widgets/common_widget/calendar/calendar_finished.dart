import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/calendar_view_model.dart';
import '../../common/image_extention.dart';
import 'calendar_list_view_finished.dart';

class CalendarFinished extends StatefulWidget {
  const CalendarFinished({super.key});

  @override
  State<CalendarFinished> createState() => _CalendarAllEventsFbState();
}

class _CalendarAllEventsFbState extends State<CalendarFinished> {
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
              // Sliver header
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              //     child: Column(
              //       children: [
              //         _grandsPrixMonth('Calendar Add'),
              //       ],
              //     ),
              //   ),
              // ),
              // Obx(() {
              //   if (controller.addCalendarAllEvents.isEmpty) {
              //     return const SliverFillRemaining(
              //         child: Center(child: Text('No data added yet')));
              //   } else {
              //     return GrandPrixCardFinished(
              //       controller: controller,
              //       listDS: controller.addCalendarAllEvents,
              //     );
              //   }
              // }),
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
                if (controller.allEventsNovemberTest.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsNovemberTest,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('February'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsFebruary.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsFebruary,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('March'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsMarch.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsMarch,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('April'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsApril.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsApril,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('May'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsMay.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsMay,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('June'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsJune.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsJune,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('July'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsJuly.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsJuly,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('August'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsAugust.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsAugust,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('September'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsSeptember.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsSeptember,
                  );
                }
              }),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Column(
                    children: [
                      _grandsPrixMonth('October'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.allEventsOctober.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return GrandPrixCardFinished(
                    controller: controller,
                    listDS: controller.allEventsOctober,
                  );
                }
              }),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              //     child: Column(
              //       children: [
              //         _grandsPrixMonth('November'),
              //       ],
              //     ),
              //   ),
              // ),
              // Obx(() {
              //   if (controller.allEventsNovember.isEmpty) {
              //     return const SliverFillRemaining(
              //       child: Center(child: CircularProgressIndicator()),
              //     );
              //   } else {
              //     return GrandPrixCard(
              //       controller: controller,
              //       listDS: controller.allEventsNovember,
              //     );
              //   }
              // }),
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
