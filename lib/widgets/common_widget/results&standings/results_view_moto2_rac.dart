// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common/image_extention.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/results_list_view_rac.dart';
import 'package:get/get.dart';

import '../../../view_model/results_moto2_view_model.dart';

class ResultsAndStandingsResultsMoto2Rac extends StatefulWidget {
  const ResultsAndStandingsResultsMoto2Rac({super.key});

  @override
  State<ResultsAndStandingsResultsMoto2Rac> createState() =>
      _ResultsAndStandingsResultsMotogpRacState();
}

class _ResultsAndStandingsResultsMotogpRacState
    extends State<ResultsAndStandingsResultsMoto2Rac> {
  final controllerRiders = Get.put(ResultsMoto2ViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMoto2Official(),
              controllerRiders.fetchRidersMoto2Substitute(),
              controllerRiders.fetchRidersMoto2WildcardsAndTestRiders(),
              controllerRiders.fetchResultMoto2RAC(),
              // controllerRiders.fetchRidersresultMotoGPRACAdd(),
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
                      _grandsPrixMonth('Moto2 RAC'),
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
                if (controllerRiders.resultsMoto2RAC.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SliverListResults(
                    controller: controllerRiders,
                    listDS: controllerRiders.resultsMoto2RAC,
                  );
                }
              }),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         _grandsPrixMonth('MotoGP RAC Add'),
              //       ],
              //     ),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              //     child: Column(
              //       children: [
              //         _textInfomation(),
              //       ],
              //     ),
              //   ),
              // ),
              // Obx(() {
              //   if (controllerRiders.resultsMotoGPRACAdd.isEmpty) {
              //     return const SliverFillRemaining(
              //         child: Center(child: Text('No data added yet')));
              //   } else {
              //     return SliverListResults(
              //       controller: controllerRiders,
              //       listDS: controllerRiders.resultsMotoGPRACAdd,
              //     );
              //   }
              // }),
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
                Row(
                  children: [
                    _textHeaderBlack('Pos.'),
                    const SizedBox(
                      width: 2,
                    ),
                    _textHeaderGrey('Pts'),
                  ],
                ),
                Row(
                  children: [
                    _textHeaderBlack('Rider'),
                    const SizedBox(
                      width: 2,
                    ),
                    _textHeaderGrey('Team'),
                  ],
                ),
                _textHeaderBlack('Time/Gap'),
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
      style: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Text _textHeaderGrey(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
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
