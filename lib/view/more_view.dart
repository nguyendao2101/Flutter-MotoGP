import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common/image_extention.dart';
import 'package:get/get.dart';

import '../widgets/common_widget/riders&teams/riders_and_teams_main_view.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF7F0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text('Subscibe to', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
              const SizedBox(height: 20,),
              _pictureAsianFacific(ImageAssest.more1),
              const SizedBox(height: 4,),
              _pictureAsianFacific(ImageAssest.more2),
              const SizedBox(height: 20,),
               Row(
                children: [
                  const Text('Riders & Teams', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                  const SizedBox(width: 4,),
                  Image.asset(ImageAssest.arrowsCross, height: 24, width: 12,),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(() => const RidersAndTeamsMainView(initialIndex: 0,));
                    },
                      child: _containerRiderAndTeam(ImageAssest.riders, 'Riders')),
                  const SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      Get.to(() => const RidersAndTeamsMainView(initialIndex: 1));
                    },
                      child: _containerRiderAndTeam(ImageAssest.teams, 'Teams')),
                  const SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      Get.to(() => const RidersAndTeamsMainView(initialIndex: 2));
                    },
                      child: _containerRiderAndTeam(ImageAssest.legends, 'Legends'))
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Text('Explore MotoGP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                  const SizedBox(width: 4,),
                  Image.asset(ImageAssest.arrowsCross, height: 24, width: 12,),
                ],
              ),
              const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              width: 390,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: 24,
                    left: 16,
                    child: _exploreMotoGP(ImageAssest.ticket, 'Ticket'),
                  ),
                  // Thêm các widget khác vào Stack nếu cần
                  Positioned(
                    top: 60, // Điều chỉnh vị trí của widget tiếp theo
                    left: 8,
                    child: _drawRow(),
                  ),
                  Positioned(
                    top: 84,
                    left: 16,
                    child: _exploreMotoGP(ImageAssest.star, 'Experiences'),
                  ),
                  // Thêm các widget khác vào Stack nếu cần
                  Positioned(
                    top: 180, // Điều chỉnh vị trí của widget tiếp theo
                    left: 8,
                    child: _drawRow(),
                  ),
                  Positioned(
                    top: 144,
                    left: 16,
                    child: _exploreMotoGP(ImageAssest.store, 'Store'),
                  ),
                  // Thêm các widget khác vào Stack nếu cần
                  Positioned(
                    top: 120, // Điều chỉnh vị trí của widget tiếp theo
                    left: 8,
                    child: _drawRow(),
                  ),
                  Positioned(
                    top: 204,
                    left: 16,
                    child: _exploreMotoGP(ImageAssest.motoGPAuthentic, 'MotoGP™ Authentics'),
                  ),
                  // Thêm các widget khác vào Stack nếu cần
                  Positioned(
                    top: 180, // Điều chỉnh vị trí của widget tiếp theo
                    left: 8,
                    child: _drawRow(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100,),
          ],
          ),
        ),
      ),
    );
  }
  Container _pictureAsianFacific(String image) {
    return Container(
      height: 80,
      color: const Color(0xff000000),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
  Container _containerRiderAndTeam(String image, String text){
    return Container(
      height: 110,
      width: 110,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 24, width: 24,),
          const SizedBox(height: 8,),
          Text(text, style: const TextStyle(fontSize: 20, color: Colors.black),)
        ],
      ),
    );
  }

  Widget _drawRow(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0.5,
        width: 330,
        color: Colors.grey[400],
      ),
    );
  }

  Row _exploreMotoGP(String image, String text){
    return Row(
      children: [
        Image.asset(
          image,
          height: 18,
        ),
        const SizedBox(width: 8),
         Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
