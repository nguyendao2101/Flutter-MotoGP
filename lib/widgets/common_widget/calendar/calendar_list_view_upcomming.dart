// ignore_for_file: invalid_use_of_protected_member, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common/image_extention.dart';
import 'package:get/get.dart';
import 'calendar_detail.dart';

class GrandPrixCard extends StatelessWidget {
  final controller;
  final RxList<Map<String, dynamic>>
      listDS; // Truyền thêm danh sách ridersListMotoGP

  const GrandPrixCard({
    super.key,
    this.controller,
    required this.listDS,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final calendarList = listDS.value
          .where((calendar) => calendar['Status'] == 'Upcoming')
          .toList();
      if (listDS.isEmpty) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var calendar = calendarList[index];
                String eventName = calendar['EventName'];
                String formattedEventName = eventName.length > 15
                    ? '${eventName.substring(0, 12)}...'
                    : eventName;

                return InkWell(
                  onTap: () {
                    Get.to(() => CalendarDetail(
                          calendar: calendar,
                        ));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          decoration: BoxDecoration(
                            gradient: calendar['Category'] == 'GP17' //1
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF1E201E),
                                      Color(0xFF3D0000)
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
                            borderRadius: BorderRadius.circular(6), // Bo góc
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
                        ),
                        Positioned(
                          top: 60,
                          right: 20,
                          child: calendar['Category'] == 'GP17'
                              ? Image.asset(
                                  ImageAssest.angleRightWhite,
                                  height: 24,
                                  width: 24,
                                )
                              : Image.asset(
                                  ImageAssest.angleRightBlack,
                                  height: 24,
                                  width: 24,
                                ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Image.network(
                            // grandPrixImage,
                            calendar['ImageCountry'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  //image country
                                  Image.network(
                                    // grandCountry,
                                    calendar['ImageDetail'],
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    // day start,
                                    calendar['DayStart'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: calendar['Category'] == 'GP17'
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    // monthStart,
                                    '-',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: calendar['Category'] == 'GP17'
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    // day end,
                                    calendar['DayEnd'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: calendar['Category'] == 'GP17'
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    // monthStart,
                                    calendar['MonthEnd'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: calendar['Category'] == 'GP17'
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                formattedEventName,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: calendar['Category'] == 'GP17'
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow
                                    .ellipsis, // Đảm bảo hiển thị "..." nếu vẫn vượt quá dòng
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 2,
                          left: 10,
                          child: Container(
                            width: 70,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(255, 180, 41, 31),
                                  Colors.black,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Center(
                                child: Text(
                                  ' ${calendar['Category']} ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount:
                  calendarList.length, // Số lượng phần tử trong danh sách
            ),
          ),
        );
      }
    });
  }
}
