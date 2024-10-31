import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_list_view.dart';
import 'package:get/get.dart';
import '../../../view_model/results_moto3_view_model.dart';
import '../../common/image_extention.dart';

class RidersMoto3View extends StatelessWidget {
  final controller = Get.put(ResultsMoto3ViewModel());

  RidersMoto3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersMoto3Official(),
              controller.fetchRidersMoto3Substitute(),
              controller.fetchRidersMoto3WildcardsAndTestRiders(),
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
                if (controller.ridersListMoto3Official.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverListRiders(
                    controller: controller,
                    listDS: controller.ridersListMoto3Official,
                  );
                }
              }),

              // Sliver footer
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      _grandsPrixMonth('Wildcards And Test Riders'),
                    ],
                  ),
                ),
              ),

              Obx(
                () {
                  if (controller
                      .ridersListMoto3WildcardsAndTestRiders.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto3WildcardsAndTestRiders,
                    );
                  }
                },
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      _grandsPrixMonth('Substitute'),
                    ],
                  ),
                ),
              ),

              Obx(
                () {
                  if (controller.ridersListMoto3Substitute.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListRiders(
                      controller: controller,
                      listDS: controller.ridersListMoto3Substitute,
                    );
                  }
                },
              ),
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
