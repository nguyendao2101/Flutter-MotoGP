import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_list_view.dart';
import 'package:get/get.dart';
import '../../../view_model/results_motogp_view_model.dart';
import '../widgets/common/image_extention.dart';


class HomeView extends StatelessWidget {
  final controller = Get.put(RidersAndTeamsViewModels());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchRidersMotoGP(),
              controller.fetchRidersMotoGPSubstitute(),
              controller.fetchRidersMotoGPWildCardsAndTestRiders(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Column(
                    children: [
                      _pictureAsianFacific(ImageAssest.homeCircuit, 250),
                      const SizedBox(height: 20,),
                      _pictureAsianFacific(ImageAssest.homePic, 100)
                    ],
                  ),
                ),
              ),
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
                if (controller.ridersListMotoGP.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverListRiders(
                    controller: controller,
                    listDS: controller.ridersListMotoGP,
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
                  if (controller.ridersListMotoGP.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListRiders(
                      controller: controller,
                      listDS: controller.ridersListMotoGPWildCardsAndTestRiders,
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
                  if (controller.ridersListMotoGP.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListRiders(
                      controller: controller,
                      listDS: controller.ridersListMotoGPSubstitute,
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
  Container _pictureAsianFacific(String image, double height) {
    return Container(
      height: height,
      color: const Color(0xff000000),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
