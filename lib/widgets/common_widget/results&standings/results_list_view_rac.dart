import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../riders&teams/rider_detail.dart';

class SliverListResults extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final RxList<Map<String, dynamic>> listDS; // Sử dụng RxList từ controller

  const SliverListResults(
      {super.key, required this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: invalid_use_of_protected_member
      final resultsList = listDS.value;

      if (resultsList.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        // resultsList.sort((a, b) => b['Points'].compareTo(a['Points']));
        sortResultsByPoints(resultsList);

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var result = resultsList[index];
                var riderDetails =
                    result['RiderDetails']; // Lấy thông tin tay đua
                // name
                String riderName = riderDetails['Name'];
                List<String> nameParts = riderName.split(' ');

                // Kiểm tra nếu tên có ít nhất hai phần (tên và họ)
                String formattedRiderName = nameParts.length >= 2
                    ? '${nameParts[0][0]}. ${nameParts[1]}${nameParts.length > 2 ? '...' : ''}'
                    : riderName;

                // team
                String team = riderDetails['Team'];
                String formattedTeam =
                    team.length > 15 ? '${team.substring(0, 12)}...' : team;

                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                      child: Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '#${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    controller
                                        .zeroToSpace(result['Points'])
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                result['Time'],
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 20,
                      child: Image.network(
                        riderDetails['ImageRacer'],
                        height: 90,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 110,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                controller.extractNumbers(result['Id']),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => RiderDetailScreen(
                                        rider: riderDetails,
                                      ));
                                },
                                child: Text(
                                  formattedRiderName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 110,
                      child: Row(
                        children: [
                          Image.network(
                            riderDetails['ImageCountry'],
                            height: 12,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            formattedTeam,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount:
                  resultsList.length, // Số lượng phần tử trong danh sách
            ),
          ),
        );
      }
    });
  }

  void sortResultsByPoints(List<Map<String, dynamic>> resultsList) {
    resultsList.sort((a, b) {
      // Lấy giá trị Points của a và b, nếu không có thì mặc định là 0
      int pointsA;
      int pointsB;

      // Kiểm tra kiểu dữ liệu của a['Points']
      if (a['Points'] is int) {
        pointsA = a['Points'];
      } else if (a['Points'] is String) {
        pointsA = int.tryParse(a['Points']) ?? 0;
      } else {
        pointsA = 0;
      }

      // Kiểm tra kiểu dữ liệu của b['Points']
      if (b['Points'] is int) {
        pointsB = b['Points'];
      } else if (b['Points'] is String) {
        pointsB = int.tryParse(b['Points']) ?? 0;
      } else {
        pointsB = 0;
      }

      // Sắp xếp theo thứ tự giảm dần
      return pointsB.compareTo(pointsA);
      // return pointsA.compareTo(pointsB);
    });
  }
}
