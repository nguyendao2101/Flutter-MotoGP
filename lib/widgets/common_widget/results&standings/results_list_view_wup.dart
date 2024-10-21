// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/results_motogp_view_model.dart';
import '../riders&teams/rider_detail.dart';

class SliverListResultsMotoGPWUP extends StatelessWidget {
  final RidersAndTeamsViewModels controller;
  final RxList<Map<String, dynamic>> listDS; // Sử dụng RxList từ controller

  const SliverListResultsMotoGPWUP(
      {super.key, required this.controller, required this.listDS});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final resultsList = listDS.value;

      if (resultsList.isEmpty) {
        return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        sortResultsByTime(resultsList);

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
                String formattedTeam = team.length > 15
                    ? '${team.substring(0, 12)}...'
                    : team;

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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 4,),
                                  Text(
                                    '#${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 26),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    result['Time'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    result['Gap'],
                                    style:
                                    const TextStyle(fontSize: 12, color: Colors.grey),
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
                      left: 15,
                      child: Image.network(
                        riderDetails['ImageRacer'],
                        height: 90,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 120,
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
                              SizedBox(width: 2,),

                              InkWell(
                                onTap: (){
                                  Get.to(() => RiderDetailScreen(rider: riderDetails,));
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
                      left: 120,
                      child: Row(
                        children: [
                          Image.network(
                            riderDetails['ImageCountry'],
                            height: 12,
                          ),
                          SizedBox(width: 4,),
                          Text(
                            formattedTeam,
                            style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 380,
                      child: Text(
                        controller.extractNumbers(result['Id']),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 480,
                      child: InkWell(
                        onTap: () {
                          Get.to(RiderDetailScreen(
                            rider: riderDetails,
                          ));
                        },
                        child: Text(
                          riderDetails['Name'],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 780,
                      child: Image.network(
                        riderDetails['ImageCountry'],
                        height: 20,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 840,
                      child: Text(
                        riderDetails['Team'],
                        style:
                        const TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 1540,
                      child: Text(
                        result['Gap'],
                        style:
                        const TextStyle(fontSize: 20, color: Colors.grey),
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

  void sortResultsByTime(List<Map<String, dynamic>> resultsList) {
    // Hàm chuyển đổi chuỗi thời gian thành giây
    double convertTimeToSeconds(String time) {
      // Tách thời gian ra theo phút, giây và mili giây
      List<String> parts = time.split(':');
      int minutes = int.parse(parts[0]);
      List<String> secondsParts = parts[1].split('.');
      int seconds = int.parse(secondsParts[0]);
      int milliseconds = int.parse(secondsParts[1]);

      // Tính tổng số giây
      return minutes * 60 + seconds + milliseconds / 1000;
    }

    // Sắp xếp danh sách dựa trên giá trị thời gian đã chuyển đổi
    resultsList.sort((a, b) {
      double timeA = convertTimeToSeconds(a['Time']);
      double timeB = convertTimeToSeconds(b['Time']);
      return timeA.compareTo(timeB); // Sắp xếp tăng dần
    });
  }
}
