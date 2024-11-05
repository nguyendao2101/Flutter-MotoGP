// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_moto_gp/view_model/login_view_model.dart';
import 'package:get/get.dart';

import '../widgets/common/color_extentionn.dart';
import '../widgets/common/image_extention.dart';
import 'login_view.dart';

class InfoUserView extends StatefulWidget {
  const InfoUserView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<InfoUserView> {
  late DatabaseReference _database;
  late String _userId;
  Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase.instance.ref();
    _checkUserAuthentication();
  }

  void _checkUserAuthentication() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userId = user.uid;
      _getUserData();
    } else {
      // Trì hoãn điều hướng đến LoginView cho đến khi khung hình hiện tại kết thúc.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAll(() => const LoginView());
      });
    }
  }


  void _getUserData() async {
    DatabaseReference userRef = _database.child('users/$_userId');
    DataSnapshot snapshot = await userRef.get();

    if (snapshot.exists) {
      setState(() {
        _userData = Map<String, dynamic>.from(snapshot.value as Map);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginViewModel());
    return Scaffold(
      backgroundColor: ChatColor.background,
      appBar: AppBar(
        backgroundColor: ChatColor.background,
        elevation: 0,
        title: Text('User Information',
            style: TextStyle(
                color: ChatColor.almond,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileImage(),
              const SizedBox(height: 20),
              _buildUserInfoCard(),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  controller.onLogout();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ChatColor.almond,
          width: 4.0,
        ),
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(ImageAssest.user),
        backgroundColor: ChatColor.background,
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return _userData.isNotEmpty
        ? Card(
      color: ChatColor.gray1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfoRow('Full Name', _userData['fullName']),
            const Divider(color: Colors.white24),
            _buildUserInfoRow('Email', _userData['email']),
            const Divider(color: Colors.white24),
            _buildUserInfoRow('Address', _userData['address']),
            const Divider(color: Colors.white24),
            _buildUserInfoRow('Sex', _userData['sex']),
          ],
        ),
      ),
    )
        : const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _buildUserInfoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ChatColor.almond,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value ?? '',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
