import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/watch_view_model.dart';
import '../widgets/common/image_extention.dart';
import '../widgets/common_widget/watch/watch_list_view.dart';

class WatchView extends StatelessWidget {
  final controller = Get.put(WatchViewModel());

  WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controller.fetchWatchActionClipsBestMotoGP(),
              controller.fetchWatchActionClipsotMotoGPRace(),
              controller.fetchWatchActionClipsTheMostMind(),
              controller.fetchWatchAfterTheFlagAustrianGP2024(),
              controller.fetchWatchAfterTheFlagBagnaiaJoins(),
              controller.fetchWatchAfterTheFlagPerfect(),
              controller.fetchWatchInterviewsPodiumTrio(),
              controller.fetchWatchInterviewsTop3React(),
              controller.fetchWatchInterviewsWhenRossi(),
              controller.fetchWatchLatesVideosItsTime(),
              controller.fetchWatchLatesVideosMar2024(),
              controller.fetchWatchLatesVideosMar12th(),
              controller.fetchWatchMustSeeBestMotoGP(),
              controller.fetchWatchMustSeeBigDrama(),
              controller.fetchWatchMustSeeTheEmotion(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // SliverGrid for displaying riders
              _title('Action Clips'),
              Obx(
                () {
                  if (controller.watchActionClipsBestMotoGP.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchActionClipsBestMotoGP,
                    );
                  }
                },
              ),

              _h20(),
              Obx(
                () {
                  if (controller.watchActionClipsTheMostMind.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchActionClipsTheMostMind,
                    );
                  }
                },
              ),
              _title('After The Flag'),
              Obx(
                () {
                  if (controller.watchAfterTheFlagAustrianGP2024.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchAfterTheFlagAustrianGP2024,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchAfterTheFlagBagnaiaJoins.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchAfterTheFlagBagnaiaJoins,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchAfterTheFlagPerfect.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchAfterTheFlagPerfect,
                    );
                  }
                },
              ),
              _title('Interviews and Reactions'),
              Obx(
                () {
                  if (controller.watchInterviewsPodiumTrio.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchInterviewsPodiumTrio,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchInterviewsTop3React.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchInterviewsTop3React,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchInterviewsWhenRossi.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchInterviewsWhenRossi,
                    );
                  }
                },
              ),
              _title('Latest Videos'),
              Obx(
                () {
                  if (controller.watchLatesVideosItsTime.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchLatesVideosItsTime,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchLatesVideosMar2024.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchLatesVideosMar2024,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchLatesVideosMar12th.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchLatesVideosMar12th,
                    );
                  }
                },
              ),
              _title('MotoGP-Podcast'),
              Obx(
                () {
                  if (controller.watchMotoGPPodcastAlbert.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchMotoGPPodcastAlbert,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchMotoGPPodcastFranco.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchMotoGPPodcastFranco,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchMotoGPPodcastPecco.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchMotoGPPodcastPecco,
                    );
                  }
                },
              ),
              _title('Must-See'),
              Obx(
                () {
                  if (controller.watchMustSeeBestMotoGP.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchMustSeeBestMotoGP,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchMustSeeBigDrama.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchMustSeeBigDrama,
                    );
                  }
                },
              ),
              _h20(),
              Obx(
                () {
                  if (controller.watchMustSeeBestTheEmotion.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return WatchListView(
                      controller: controller,
                      listDS: controller.watchMustSeeBestTheEmotion,
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

  Widget _title(String text) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            _watchTitle(text),
          ],
        ),
      ),
    );
  }

  Widget _h20() {
    return const SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Row _watchTitle(String text) {
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
}
