import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/rider_detail.dart';
import 'package:get/get.dart';

class SliverListRiders extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>> listDS;

  const SliverListRiders(
      {super.key, required this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (listDS.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              var rider = listDS[index];
              String teamName = rider['Team'];
              String formattedTeamName = teamName.length > 8
                  ? '${teamName.substring(0, 8)}...'
                  : teamName;
              String name = rider['Name'];
              String formattedName = name.contains(' ')
                  ? name.replaceAll(' ', '\n')
                  : name;
              return InkWell(
                onTap: () {
                  Get.to(() => RiderDetailScreen(rider: rider));
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
                          rider['ImageRacer'] != ''
                              ? Positioned(
                            top: 2,
                            right: -45,
                            child: Image.network(
                              rider['ImageRacer'],
                              height: 180,
                            ),
                          )
                              : const Center(
                            child: Icon(Icons.person,
                                size: 50, color: Colors.grey),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 10,
                            child: Text(
                            '#${rider['Id']}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),),
                          Positioned(
                            top: 15,
                            left: 15,
                            child: Text(
                              formattedName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                            overflow: TextOverflow.ellipsis,
                          ),),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            child: Row(
                            children: [
                              Image.network(
                                rider['ImageCountry'],
                                height: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rider['Country'],
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: 4),
                              const Text('|',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              const SizedBox(width: 4),
                              Text(
                                formattedTeamName,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),)
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

  // Hàm tạo màu ngẫu nhiên
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
