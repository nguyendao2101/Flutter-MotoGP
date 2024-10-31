import 'package:flutter/material.dart';
import '../../common/image_extention.dart';

class RidersLegendsDetail extends StatelessWidget {
  final Map<String, dynamic> rider;
  const RidersLegendsDetail({super.key, required this.rider});

  @override
  Widget build(BuildContext context) {
    String country = rider['Country'];
    String formattedcountry =
    country.length > 5 ? '${country.substring(0, 5)}...' : country;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A L L  L E G E N D S',
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
                child: Column(
                  children: [
                    // Hình ảnh của rider
                    if (rider['ImageRacer'] != '')
                      Image.network(
                        rider['ImageRacer'],
                        height: 300,
                      )
                    else
                      const Icon(Icons.person, size: 250, color: Colors.grey),
                    const SizedBox(height: 20),
                    // Thông tin của rider
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          rider['ImageCountry'],
                          height: 20,
                        ),
                        _sizeBoxW4(),
                        Text(
                          formattedcountry,
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
                        RichText(
                          text: TextSpan(
                            text: 'Years Active ',
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: rider['Years Active'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.white),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          ImageAssest.redFlag,
                          height: 36,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Career Highlight',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Các container hiển thị chi tiết mùa giải
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _seasonContainer('WORLD CHA...', rider['WorldChampionshipTitles'].toString()),
                        _seasonContainer('DEBUT', rider['Debut'].toString()),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _seasonContainer('SEASONS', rider['Seasons'].toString()),
                        _seasonContainer('LAST RACE', rider['Last Race'].toString()),
                      ],
                    ),

                  ],
                ),
              ),
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

  Padding _rowResultsTotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Cho phép cuộn ngang
        child: Container(
          color: const Color(0xffF8EDFF),
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
        ),
      ),
    );
  }

  Container _seasonContainer(String title, String value) {
    return Container(
      height: 130,
      width: 160,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 39, 33, 33),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: _currentSeason(title, value),
        ),
      ),
    );
  }

  Widget _currentSeason(String name, String number) {
    return Column(
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
    );
  }

  dynamic zeroToS(dynamic number) {
    return number == 0 ? '-' : number;
  }

  Container _containerResultDetail(String text, String number) {
    String displayText = text.length > 7 ? '${text.substring(0, 7)}...' : text;
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
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

  SizedBox _sizeBoxW4() {
    return const SizedBox(width: 8);
  }
}
