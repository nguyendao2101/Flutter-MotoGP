import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_list_view.dart';
import 'package:get/get.dart';

import '../../../view_model/results_motoe_view_model.dart';

import '../../common/image_extention.dart';


class RidersMotoeView extends StatelessWidget {
  final controller = Get.put(ResultsMotoeViewModel());

  RidersMotoeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersMotoEOfficial(),
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
                      _grandsPrixMonth('Official'),
                    ],
                  ),
                ),
              ),

              // SliverGrid for displaying riders
              Obx(() {
                if (controller.ridersListMotoEOfficial.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverListRiders(
                    controller: controller,
                    listDS: controller.ridersListMotoEOfficial,
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
