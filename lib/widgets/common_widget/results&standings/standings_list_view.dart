import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../riders&teams/rider_detail.dart';

class ResultsAndStandingsStadingsListView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final RxList<Map<String, dynamic>> listDS; // Sử dụng RxList từ controller
  const ResultsAndStandingsStadingsListView(
      {super.key, this.controller, required this.listDS});

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
        // Sắp xếp danh sách theo điểm số tăng dần
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
                          gradient: index == 0 //1
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF1E201E),
                                    Color(0xFF4F1787)
                                  ], // Các màu gradient
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : const LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white
                                  ], // Gradient mặc định nếu id không phải là 1
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '#${index + 1}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: index == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    result['Points'].toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 10,
                      child: Image.network(
                        riderDetails['ImageRacer'],
                        height: 90,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 100,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                controller.extractNumbers(result['Id']),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.black,
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
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 100,
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
                            style: TextStyle(
                                fontSize: 16,
                                color: index == 0 ? Colors.white : Colors.grey),
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
