import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/widgets/common_widget/riders&teams/teams_list_view.dart';
import 'package:get/get.dart';
import '../../../view_model/riders_and_teams_teams_motoe_view_model.dart';
import '../../../view_model/riders_and_teams_teams_motogp_view_model.dart';
import '../../common/image_extention.dart';

class TeamsMotoeView extends StatefulWidget {
  const TeamsMotoeView({super.key});

  @override
  State<TeamsMotoeView> createState() =>
      _RidersAndTeamsTeamsMotoGPState();
}

class _RidersAndTeamsTeamsMotoGPState extends State<TeamsMotoeView> {
  @override
  Widget build(BuildContext context) {
    final controllerRiders = Get.put(RidersAndTeamsTeamsMotoeViewModel());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              controllerRiders.fetchRidersMotoe(),
              controllerRiders.fetchTeamsMotoe(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              // Sliver header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _grandsPrixMonth('Teams'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controllerRiders.teamsMotoe.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ListViewTeams(
                    controller: controllerRiders,
                    listDS: controllerRiders.teamsMotoe,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _grandsPrixMonth(String text) {
    return Row(
      children: [
        Image.asset(ImageAssest.redFlag, height: 28),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
