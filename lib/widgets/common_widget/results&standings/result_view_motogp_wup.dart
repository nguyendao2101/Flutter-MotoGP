// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/results_list_view_wup.dart';

import 'package:get/get.dart';

import '../../../view_model/results_motogp_view_model.dart';
import '../../common/image_extention.dart';

class ResultsAndStandingsResultsMotogpWup extends StatelessWidget {
  const ResultsAndStandingsResultsMotogpWup({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(RidersAndTeamsViewModels());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMotoGP(),
              controllerRiders.fetchRidersMotoGPSubstitute(),
              controllerRiders.fetchRidersMotoGPWildCardsAndTestRiders(),
              controllerRiders.fetchResultMotoGPWUP(),
              // controllerRiders.fetchRidersresultMotoGPWUPAdd(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _grandsPrixMonth('MotoGP WUP'),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      _textInfomation(),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controllerRiders.ridersListMotoGP.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {

                  return SliverListResultsMotoGPWUP(
                    controller: controllerRiders,
                    listDS: controllerRiders.resultsMotoGPWUP,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInfomation() {
    return Stack(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white, // Màu nền của Container
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow offset
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textHeaderBlack('Pos.'),
                Row(
                  children: [
                    _textHeaderBlack('Rider'),
                    const SizedBox(
                      width: 2,
                    ),
                    _textHeaderGrey('Team'),
                  ],
                ),
                Row(
                  children: [
                    _textHeaderBlack('Time'),
                    const SizedBox(
                      width: 2,
                    ),
                    _textHeaderGrey('Gap 1st/Prev.'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text _textHeaderBlack(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Text _textHeaderGrey(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
    );
  }

  Row _grandsPrixMonth(String text) {
    return Row(
      children: [
        Image.asset(ImageAssest.redFlag, height: 44),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
