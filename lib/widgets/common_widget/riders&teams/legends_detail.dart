import 'package:flutter/material.dart';
import '../../common/image_extention.dart';

class RidersLegendsDetail extends StatelessWidget {
  final Map<String, dynamic> rider;
  const RidersLegendsDetail({super.key, required this.rider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A L L  R I D E R S',
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blueAccent.withOpacity(0.8)
              ], // Các màu gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Gradient background
                Container(
                  height: 900, // Đặt chiều cao cố định để tránh lỗi
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.blueAccent.withOpacity(0.8)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        // Hình ảnh của rider
                        Positioned(
                          top: 40,
                          left: 40,
                          child: rider['ImageRacer'] != ''
                              ? Image.network(
                            rider['ImageRacer'],
                            height: 300,
                          )
                              : const Icon(Icons.person,
                              size: 250, color: Colors.grey),
                        ),
                        // Thông tin của rider
                        Positioned(
                          top: 340,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '#${rider['Id']}',
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                rider['Name'],
                                style: const TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.network(
                                    rider['ImageCountry'],
                                    height: 20,
                                  ),
                                  _sizeBoxW4(),
                                  Text(
                                    rider['Country'],
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  _sizeBoxW4(),
                                  const Text(
                                    '|',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                  _sizeBoxW4(),
                                  Text(
                                    'YEARS ACTIVE ${rider['Years Active']}',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 560,
                          left: 15,
                          child: Container(
                            height: 130,
                            width: 160,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'WORLD CHA...',
                                    rider['WorldChampionshipTitles']
                                        .toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 700,
                          left: 15,
                          child: Container(
                            height: 130,
                            width: 160,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'DEBUT', rider['Debut'].toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 560,
                          right: 15,
                          child: Container(
                            height: 130,
                            width: 160,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'SEASONS', rider['Seasons'].toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 700,
                          right: 15,
                          child: Container(
                            height: 130,
                            width: 160,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 39, 33, 33),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: _currentSeason(
                                    'LAST RACE', rider['Last Race'].toString()),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 480,
                            child: Container(
                          height: 0.5,
                          width: 360,
                          color: Colors.white,
                        )),
                        Positioned(
                          top: 500,
                          left: 0,
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssest.redFlag,
                                height: 36,
                              ),
                              const Text(
                                'Career Highlight',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Image.asset(ImageAssest.redFlag, height: 30),
                  const Text(
                    'Rider Stats',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            _textResult('TOTAL'),
            _rowResultsTotal(),
          ],
        ),
      ),
    );
  }

  dynamic zeroToS(dynamic number) {
    return number == 0 ? '-' : number;
  }

  Padding _rowResultsTotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _containerResultDetail('WORLD CHAMPIONSHIPS',
              zeroToS(rider['TotalWorldChampionships']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'VICTORIES', zeroToS(rider['TotalVictories']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'PODIUMS', zeroToS(rider['TotalPodiums']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'POLES', zeroToS(rider['ToTalPoles']).toString()),
          const SizedBox(
            width: 20,
          ),
          _containerResultDetail(
              'RACES', zeroToS(rider['TotalRaces']).toString()),
        ],
      ),
    );
  }

  Container _containerResultDetail(String text, String number) {
    String displayText = text.length > 7 ? '${text.substring(0, 7)}...' : text;
    return Container(
      height: 100,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white, // Màu nền của Container
        borderRadius: BorderRadius.circular(6), // Bo góc
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Màu bóng mờ (đen mờ)
            spreadRadius: 5, // Độ lan rộng của bóng
            blurRadius: 10, // Độ mờ của bóng
            offset: const Offset(0, 3), // Vị trí của bóng (trục x, trục y)
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            displayText,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Text(
            number,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )
        ],
      ),
    );
  }

  Padding _textResult(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            child: Text(text),
          ),
        ],
      ),
    );
  }

  Widget _currentSeason(String name, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
            Text(
              number,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _sizeBoxW4() {
    return const SizedBox(
      width: 8,
    );
  }
}
