// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  // new
  RxList<Map<String, dynamic>> theTitlEpendulum = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNews2024FIM = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNews37Points = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNewsBagnaiaGiven =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNewsGoldenAi = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNewsHasDucati = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNewsLetsTheGames =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNewsMotoGPEngine =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNewsOliveiraUndergoes =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeNewsWillBastianini =
      <Map<String, dynamic>>[].obs;
  //videos
  RxList<Map<String, dynamic>> homeVideosDavidAlon =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeVideosTheWait = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> homeVideosTitlePendulum =
      <Map<String, dynamic>>[].obs;
  // Temporary storage for rider details
  Map<dynamic, Map<dynamic, dynamic>> home = {};

  @override
  void onInit() {
    super.onInit();
    //news
    fetchHomeNews2024FIM();
    fetchHomeNews37Points();
    fetchHomeBagnaiaGiven();
    fetchHomeNewsGoldenAi();
    fetchHomeHasDucati();
    fetchHomeNewsLetsTheGames();
    fetchHomeNewsMotoGPEngine();
    fetchHomeNewsOliveiraUndergoes();
    fetchHomeNewsWillBastianini();
    // videos
    fetchHomeVideosDavidAlone();
    fetchHomeVideosTheWait();
    fetchHomeVideosTitlePendulum();
  }

  //videos
  Future<void> fetchHomeVideosDavidAlone() async {
    DatabaseReference calendarRef =
        _databaseReference.child('News/Videos/DavidAlonsosRoadToMoto3Glory');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      print('from videos: ${snapshot.value.runtimeType}');

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeVideosDavidAlon.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              'LinkYoutube': value['LinkYoutube'] ?? 'N/A',
            };

            homeVideosDavidAlon.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeVideosTheWait() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/Videos/The wait is over, a new chapter is written');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      print('from videos: ${snapshot.value.runtimeType}');

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeVideosTheWait.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              'LinkYoutube': value['LinkYoutube'] ?? 'N/A',
            };

            homeVideosTheWait.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeVideosTitlePendulum() async {
    DatabaseReference calendarRef =
        _databaseReference.child('News/Videos/TitlePendulum');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      print('from videos: ${snapshot.value.runtimeType}');

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeVideosTitlePendulum.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              'LinkYoutube': value['LinkYoutube'] ?? 'N/A',
            };

            homeVideosTitlePendulum.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  //news

  Future<void> fetchHomeNews2024FIM() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/New/2024 FIM MiniGP World Series Ambassadors revealed!');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNews2024FIM.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
              '10': value['10'] ?? 'N/A',
            };

            homeNews2024FIM.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeNews37Points() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/New/37 points to survival of the fittest');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNews37Points.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
              '10': value['10'] ?? 'N/A',
              '12': value['12'] ?? 'N/A',
            };

            homeNews37Points.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeBagnaiaGiven() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/New/Bagnaia given three-place grid penalty for Sunday');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNewsBagnaiaGiven.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
            };

            homeNewsBagnaiaGiven.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeNewsGoldenAi() async {
    DatabaseReference calendarRef = _databaseReference.child(
        'News/New/GoldenAi: Ai Ogura crowned 2024 Moto2™ World Champion');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNewsGoldenAi.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
              '10': value['10'] ?? 'N/A',
              '12': value['12'] ?? 'N/A',
              '14': value['14'] ?? 'N/A',
              '16': value['16'] ?? 'N/A',
              '18': value['18'] ?? 'N/A',
              '20': value['20'] ?? 'N/A',
            };

            homeNewsGoldenAi.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeHasDucati() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/New/Has Ducati boss revealed 2025 VR46 rider line up?');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNewsHasDucati.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
              '10': value['10'] ?? 'N/A',
              '12': value['12'] ?? 'N/A',
              '14': value['14'] ?? 'N/A',
            };

            homeNewsHasDucati.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeNewsLetsTheGames() async {
    DatabaseReference calendarRef = _databaseReference.child(
        'News/New/Let the games begin: The 2024 Global Series starts now!');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNewsLetsTheGames.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
              '10': value['10'] ?? 'N/A',
              '12': value['12'] ?? 'N/A',
              '14': value['14'] ?? 'N/A',
              '16': value['16'] ?? 'N/A',
              '18': value['18'] ?? 'N/A',
              '20': value['20'] ?? 'N/A',
              '22': value['22'] ?? 'N/A',
              '24': value['24'] ?? 'N/A',
            };

            homeNewsLetsTheGames.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeNewsMotoGPEngine() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/New/MotoGP™ engine specification frozen for 2026');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNewsMotoGPEngine.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
            };

            homeNewsMotoGPEngine.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeNewsWillBastianini() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/New/Will Bastianini’s momentum roll into Indonesia?');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNewsWillBastianini.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
              '4': value['4'] ?? 'N/A',
              '6': value['6'] ?? 'N/A',
              '8': value['8'] ?? 'N/A',
              '10': value['10'] ?? 'N/A',
              '12': value['12'] ?? 'N/A',
              '14': value['14'] ?? 'N/A',
              '16': value['16'] ?? 'N/A',
              '18': value['18'] ?? 'N/A',
              '20': value['20'] ?? 'N/A',
            };

            homeNewsWillBastianini.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchHomeNewsOliveiraUndergoes() async {
    DatabaseReference calendarRef = _databaseReference
        .child('News/New/Oliveira undergoes surgery on fractured wrist');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        homeNewsOliveiraUndergoes.clear();

        // Chuyển đổi snapshot.value thành List<Object?>
        List<Object?> calendarList = snapshot.value as List<Object?>;

        for (var i = 0; i < calendarList.length; i++) {
          var value = calendarList[i];

          // Kiểm tra nếu value không phải là null và là Map
          if (value is Map<Object?, Object?>) {
            // Chuyển đổi LinkedMap sang Map<String, dynamic>
            Map<String, dynamic> calendarData = {
              'id': i.toString(),
              'Image': value['Image'] ?? 'N/A',
              'Title': value['Title'] ?? 'N/A',
              '1': value['1'] ?? 'N/A',
              '2': value['2'] ?? 'N/A',
            };

            homeNewsOliveiraUndergoes.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }
}
