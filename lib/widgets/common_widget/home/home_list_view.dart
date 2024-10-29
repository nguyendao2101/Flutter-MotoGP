import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/home/home_detail.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/rider_detail.dart';
import 'package:get/get.dart';

class SliverListHome extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>> listDS;

  const
  SliverListHome(
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
              var home = listDS[index];
              String homeName = home['Title'];
              String formattedHomeName = homeName.length > 30
                  ? '${homeName.substring(0, 36)}...'
                  : homeName;

              return InkWell(
                onTap: () {
                  Get.to(() => HomeDetail(home: home));
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
                            height: 280,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Màu bóng mờ (đen mờ)
                                  spreadRadius: 5, // Độ lan rộng của bóng
                                  blurRadius: 10, // Độ mờ của bóng
                                  offset: const Offset(
                                      0, 3), // Vị trí của bóng (trục x, trục y)
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2, // Chiếm 2/3 chiều cao
                                  child: home['id'] != ''
                                      ? ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Image.network(
                                      home['Image'],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  )
                                      : const Center(
                                    child: Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1, // Chiếm 1/3 chiều cao
                                  child: Container(
                                    color: Colors.white, // Màu nền của phần còn lại
                                  ),
                                ),
                              ],
                            ),
                          ),
                          home['Title'] != ''
                          ? Positioned(
                            bottom: 30,
                            left: 10,
                            child: Text(
                              formattedHomeName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),)
                          : const Center(
                            child: Icon(Icons.person,
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
