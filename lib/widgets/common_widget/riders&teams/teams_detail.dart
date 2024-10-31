import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/riders_and_teams_main_view.dart';
import 'package:get/get.dart';
import '../../common/image_extention.dart';
import 'rider_detail.dart';

class RidersAndTeamsTeamsDetail extends StatelessWidget {
  final Map<String, dynamic> team;
  final Map<String, dynamic> teamsDetail;

  const RidersAndTeamsTeamsDetail(
      {super.key, required this.team, required this.teamsDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A L L  T E A M S',
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blueAccent.withOpacity(0.8)],
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
            Container(
              height: 900,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.blueAccent.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Hình ảnh của rider
                    team['Image'] != ''
                        ? Image.network(
                      team['Image'],
                      height: 400,
                    )
                        : const Icon(Icons.person,
                        size: 250, color: Colors.grey),
                    const SizedBox(height: 20),
                    // Thông tin của rider
                    Text(
                      '${team['Team']}',
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: 'BIKE MANUFACTURER: ',
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: team['BikeManufacturer'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          ImageAssest.redFlag,
                          height: 50,
                        ),
                        const Text(
                          'Team Riders',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Rider information
                    Container(
                      height: 210,
                      width: 360,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 39, 33, 33),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(() => RiderDetailScreen(rider: teamsDetail,));
                              },
                              child: _buildRiderDetailRow(teamsDetail, team, 'Rider1',
                                  'ImageRacer', 'Name'),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                            InkWell(
                              onTap: (){
                                Get.to(() => const RidersAndTeamsMainView(initialIndex: 1,));
                              },
                              child: _buildRiderDetailRow(teamsDetail, team, 'Rider2',
                                  'TeamMateImage', 'TeamMateName'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiderDetailRow(
      Map<String, dynamic> teamsDetail,
      Map<String, dynamic> team,
      String riderKey,
      String imageKey,
      String nameKey,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            teamsDetail[imageKey] != null && teamsDetail[imageKey] != ''
                ? Image.network(
              teamsDetail[imageKey],
              height: 80,
              width: 80,
            )
                : const Icon(
              Icons.image_not_supported,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                team[riderKey] != null && team[riderKey] != ''
                    ? Text(
                  '#${team[riderKey]}',
                  style: const TextStyle(
                      fontSize: 16, color: Colors.grey),
                )
                    : const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 20,
                ),
                teamsDetail[nameKey] != null && teamsDetail[nameKey] != ''
                    ? Text(
                  teamsDetail[nameKey],
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
                    : const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
        Image.asset(
          ImageAssest.sangNgang,
          height: 12,
        ),
      ],
    );
  }
}
