// ignore_for_file: invalid_use_of_protected_member, prefer_typing_uninitialized_variables

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_detail.dart';
import 'package:get/get.dart';

class ListViewTeams extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>> listDS;
  const ListViewTeams({super.key, this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final resultsList = listDS.value;

      // Check if the list is empty
      if (resultsList.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              var result = resultsList[index];
              var riderDetails = result['RiderDetails'];
              String teamName = result['Team'];
              String formattedTeamName = teamName.length > 15
                  ? '${teamName.substring(0, 15)}...'
                  : teamName;

              return InkWell(
                onTap: () {
                  Get.to(() => RidersAndTeamsTeamsDetail(
                        team: result,
                        teamsDetail: riderDetails,
                      ));
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  _randomColor(),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 10,
                            child: Text(
                              formattedTeamName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  riderDetails['Name'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  riderDetails['TeamMateName'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 2,
                            right: 10,
                            child: result['Image'] != ''
                                ? Image.network(
                                    result['Image'],
                                    height: 300,
                                  )
                                : const Icon(Icons.person,
                                    size: 50, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: listDS.length,
          ),
        );
      }
    });
  }

  // Random color generator function
  Color _randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
