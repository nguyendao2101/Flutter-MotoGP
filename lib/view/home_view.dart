import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/home_view_model.dart';
import '../widgets/common/image_extention.dart';
import '../widgets/common_widget/home/home_list_view.dart';
import '../widgets/common_widget/watch/watch_list_view.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeViewModel());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchHomeNews2024FIM(),
              controller.fetchHomeNews37Points(),
              controller.fetchHomeBagnaiaGiven(),
              controller.fetchHomeNewsGoldenAi(),
              controller.fetchHomeHasDucati(),
              controller.fetchHomeNewsLetsTheGames(),
              controller.fetchHomeNewsMotoGPEngine(),
              controller.fetchHomeNewsOliveiraUndergoes(),
              controller.fetchHomeNewsWillBastianini(),
              controller.fetchHomeVideosDavidAlone(),
              controller.fetchHomeVideosTheWait(),
              controller.fetchHomeVideosTitlePendulum(),
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
                      const SizedBox(
                        height: 20,
                      ),
                      _pictureAsianFacific(ImageAssest.homePic, 100)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Column(
                    children: [
                      _homeTitle('Latest News'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.homeVideosDavidAlon.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return WatchListView(
                    controller: controller,
                    listDS: controller.homeVideosDavidAlon,
                  );
                }
              }),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              // SliverGrid for displaying riders
              Obx(() {
                if (controller.homeNews2024FIM.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverListHome(
                    controller: controller,
                    listDS: controller.homeNews2024FIM,
                  );
                }
              }),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNews37Points.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNews37Points,
                    );
                  }
                },
              ),

              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNewsBagnaiaGiven.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNewsBagnaiaGiven,
                    );
                  }
                },
              ),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Obx(() {
                if (controller.homeVideosTheWait.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return WatchListView(
                    controller: controller,
                    listDS: controller.homeVideosTheWait,
                  );
                }
              }),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNewsGoldenAi.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNewsGoldenAi,
                    );
                  }
                },
              ),

              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNewsHasDucati.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNewsHasDucati,
                    );
                  }
                },
              ),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(() {
                if (controller.homeVideosTitlePendulum.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return WatchListView(
                    controller: controller,
                    listDS: controller.homeVideosTitlePendulum,
                  );
                }
              }),

              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNewsLetsTheGames.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNewsLetsTheGames,
                    );
                  }
                },
              ),

              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNewsMotoGPEngine.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNewsMotoGPEngine,
                    );
                  }
                },
              ),

              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNewsOliveiraUndergoes.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNewsOliveiraUndergoes,
                    );
                  }
                },
              ),

              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),

              Obx(
                () {
                  if (controller.homeNewsWillBastianini.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverListHome(
                      controller: controller,
                      listDS: controller.homeNewsWillBastianini,
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

  Row _homeTitle(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Image.asset(
          ImageAssest.arrowRight,
          height: 28,
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
