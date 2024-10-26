import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/riders_and_teams_legends_view_model.dart';
import '../../common/image_extention.dart';
import 'legends_list_view.dart';

class LegendsMainView extends StatelessWidget {
  final controller = Get.put(RidersAndTeamsLegendsViewModel());

  LegendsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersListLegends(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      _grandsPrixMonth('Legends'),
                    ],
                  ),
                ),
              ),

              // SliverGrid for displaying riders
              Obx(() {
                if (controller.ridersListLegends.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ListViewLegends(
                    controller: controller,
                    listDS: controller.ridersListLegends,
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
