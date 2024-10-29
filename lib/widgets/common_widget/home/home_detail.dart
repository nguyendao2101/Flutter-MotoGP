import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeDetail extends StatelessWidget {
  final Map<String, dynamic> home;
  const HomeDetail({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(home['Image']),
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                          Colors.black.withOpacity(0.4), // Đặt màu và độ mờ
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  bottom: -100,
                  child: Container(
                    height: 160,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.white, // Màu nền của Container
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          home['1'], style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),),
              ],
            ),
            const SizedBox(height: 120,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: List.generate(24 ~/ 2, (index) {
                  int i = (index + 1) * 2; // Tính giá trị i từ 2 đến 24
                  if (home[i.toString()] != null) {
                    return Column(
                      children: [
                        Text(
                          home[i.toString()],
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    );
                  } else {
                    return SizedBox.shrink(); // Trả về một widget trống nếu giá trị null
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
