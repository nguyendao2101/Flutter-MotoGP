// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/standings_list_view.dart';
import 'package:get/get.dart';
import '../../../view_model/standings_motoe_view_model.dart';
import '../../common/image_extention.dart';

class ResultsAndStandingsStadingsMotoe extends StatefulWidget {
  const ResultsAndStandingsStadingsMotoe({super.key});

  @override
  State<ResultsAndStandingsStadingsMotoe> createState() =>
      _ResultsAndStandingsStadingsMotogpState();
}

class _ResultsAndStandingsStadingsMotogpState
    extends State<ResultsAndStandingsStadingsMotoe> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders =
        Get.put(ResultAndStadingsStandingsMotoeViewModel());

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMotoE(),
              controllerRiders.fetchStandingsMotoE(),
              // controllerRiders.fetchRidersStandingsMotoGPAdd(),
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
                      _grandsPrixMonth('MotoGP Standings'),
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
                if (controllerRiders.standingsMotoE.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ResultsAndStandingsStadingsListView(
                    controller: controllerRiders,
                    listDS: controllerRiders.standingsMotoE,
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
                      width: 4,
                    ),
                    _textHeaderGrey('Team'),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                _textHeaderBlack('Pts.'),

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
      style: const TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Text _textHeaderGrey(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
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
