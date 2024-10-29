import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/result_view_motogp_wup.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/results_view_moto2_rac.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/results_view_moto3_rac.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/results_view_motoe_rac.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/standings_view_moto2.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/standings_view_moto3.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/standings_view_motoe.dart';
import 'package:flutter_moto_gp/widgets/common_widget/results&standings/standings_view_motogp.dart';
import 'package:get/get.dart';

import '../../common/image_extention.dart';
import 'results_view_motogp_rac.dart';

class StandingsMainView extends StatefulWidget {
  const StandingsMainView({super.key});

  @override
  State<StandingsMainView> createState() => _ResultsMainViewState();
}

class _ResultsMainViewState extends State<StandingsMainView> {
  int selectedYear = 2024;
  String selectedChampionship = "RIDERS'CHAMPIONSHIP";
  String selectedCategory = 'motogp';
  Widget? resultWidget;

  void _showYearDialog() async {
    final result = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Year',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [2024, 2023, 2022, 2021, 2020]
              .map((year) => ListTile(
            title: Text(
              year.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () => Navigator.pop(context, year),
          ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedYear = result;
      });
    }
  }

  void _showChampionshipDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Championship',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            "RIDERS'CHAMPIONSHIP",
            "TEAMS'CHAMPIONSHIP",
            "CONTRUCSTERS'CHAMPIONSHIP",
            "BMW M AWARD"
          ]
              .map((type) => ListTile(
            title: Text(
              type.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () => Navigator.pop(context, type),
          ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedChampionship = result;
      });
    }
  }


  void _showMotoDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Category',
          style: TextStyle(color: Color(0xFFBF2EF0), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['motogp', 'moto2', 'moto3', 'motoe']
              .map((moto) => ListTile(
            title: Text(
              moto.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () => Navigator.pop(context, moto),
          ))
              .toList(),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedCategory = result;
      });
    }
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // Positioned.fill(
        //   child: Image.asset(
        //     ImageAssest.backgroundResults,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showYearDialog,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize:
                    const Size(200, 80), // Đặt kích thước tối thiểu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // This should work if the Row has enough width
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start, // Align column to start
                        children: [
                          const Text(
                            'Year',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            selectedYear.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Image.asset(
                        ImageAssest.muiTen,
                        height: 16,
                        width: 16,
                      ),
                    ],
                  ),
                  // child: Text('Year: $selectedYear'),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showChampionshipDialog,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize:
                    const Size(200, 80), // Đặt kích thước tối thiểu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // This should work if the Row has enough width
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start, // Align column to start
                        children: [
                          const Text(
                            'Event',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            selectedChampionship.length > 20
                                ? '${selectedChampionship.substring(0, 20)}...'
                                : selectedChampionship,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        ImageAssest.muiTen,
                        height: 16,
                        width: 16,
                      ),
                    ],
                  ),
                  // child: Text('Event: $selectedEvent'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showMotoDialog,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize:
                    const Size(200, 80), // Đặt kích thước tối thiểu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // This should work if the Row has enough width
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start, // Align column to start
                        children: [
                          const Text(
                            'Category',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            selectedCategory.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Image.asset(
                        ImageAssest.muiTen,
                        height: 16,
                        width: 16,
                      ),
                    ],
                  ),
                  // child: Text('Moto: ${selectedMoto.toUpperCase()}'),
                ),

                const SizedBox(height: 20),
                // Hiển thị widget dựa trên giá trị đã chọn
                ElevatedButton(
                  onPressed: () {
                    if (selectedCategory == 'motogp') {
                      Get.to(() => const ResultsAndStandingsStadingsMotogp());
                    }
                    if (selectedCategory == 'moto2') {
                      Get.to(() => const ResultsAndStandingsStadingsMoto2());
                    }
                    if (selectedCategory == 'moto3') {
                      Get.to(() => const ResultsAndStandingsStadingsMoto3());
                    }
                    if (selectedCategory == 'motoe') {
                      Get.to(() => const ResultsAndStandingsStadingsMotoe());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 138, 2, 2),
                    minimumSize:
                    const Size(100, 50), // Đặt kích thước tối thiểu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Go',
                    style: TextStyle(fontSize: 24), // Tăng kích thước chữ
                  ),
                ),

                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
