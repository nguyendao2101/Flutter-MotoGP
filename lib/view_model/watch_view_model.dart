// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class WatchViewModel extends GetxController {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  RxList<Map<String, dynamic>> watchActionClipsBestMotoGP =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchActionClipsMotoGPRace =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchActionClipsTheMostMind =
      <Map<String, dynamic>>[].obs;
  //
  RxList<Map<String, dynamic>> watchAfterTheFlagAustrianGP2024 =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchAfterTheFlagBagnaiaJoins =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchAfterTheFlagPerfect =
      <Map<String, dynamic>>[].obs;
  //
  RxList<Map<String, dynamic>> watchInterviewsTop3React =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchInterviewsPodiumTrio =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchInterviewsWhenRossi =
      <Map<String, dynamic>>[].obs;
  //
  RxList<Map<String, dynamic>> watchLatesVideosItsTime =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchLatesVideosMar2024 =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchLatesVideosMar12th =
      <Map<String, dynamic>>[].obs;
  //
  RxList<Map<String, dynamic>> watchMotoGPPodcastAlbert =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchMotoGPPodcastFranco =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchMotoGPPodcastPecco =
      <Map<String, dynamic>>[].obs;
  //
  RxList<Map<String, dynamic>> watchMustSeeBestMotoGP =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchMustSeeBigDrama =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> watchMustSeeBestTheEmotion =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWatchActionClipsBestMotoGP();
    fetchWatchActionClipsotMotoGPRace();
    fetchWatchActionClipsTheMostMind();
    fetchWatchAfterTheFlagAustrianGP2024();
    fetchWatchAfterTheFlagBagnaiaJoins();
    fetchWatchAfterTheFlagPerfect();
    fetchWatchInterviewsPodiumTrio();
    fetchWatchInterviewsTop3React();
    fetchWatchInterviewsWhenRossi();
    fetchWatchLatesVideosItsTime();
    fetchWatchLatesVideosMar2024();
    fetchWatchLatesVideosMar12th();
    fetchWatchMotoGPPodcastAlbert();
    fetchWatchMotoGPPodcastFranco();
    fetchWatchMotoGPPodcastPecco();
    fetchWatchMustSeeBestMotoGP();
    fetchWatchMustSeeBigDrama();
    fetchWatchMustSeeTheEmotion();
  }

  Future<void> fetchWatchMustSeeTheEmotion() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/MustSee/TheEmotionalMotoGPLastLap');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchMustSeeBestTheEmotion.clear();

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

            watchMustSeeBestTheEmotion.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchMustSeeBigDrama() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/MustSee/BigDramaInTheFinalLaps');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchMustSeeBigDrama.clear();

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

            watchMustSeeBigDrama.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchMustSeeBestMotoGP() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/MustSee/BestMotoGPMoments');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchMustSeeBestMotoGP.clear();

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

            watchMustSeeBestMotoGP.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchMotoGPPodcastPecco() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/MotoGPPodcast/PodcastPeccoBagnaia');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchMotoGPPodcastPecco.clear();

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

            watchMotoGPPodcastPecco.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchMotoGPPodcastFranco() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/MotoGPPodcast/PodcastFrancoMorbidelli');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchMotoGPPodcastFranco.clear();

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

            watchMotoGPPodcastFranco.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchMotoGPPodcastAlbert() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/MotoGPPodcast/PodcastAlbertoPuig');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchMotoGPPodcastAlbert.clear();

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

            watchMotoGPPodcastAlbert.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchLatesVideosMar12th() async {
    DatabaseReference calendarRef = _databaseReference
        .child('Watch/LatestVideos/MarcMarquezPhenomenalComebackFrom12th');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchLatesVideosMar12th.clear();

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

            watchLatesVideosMar12th.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchLatesVideosMar2024() async {
    DatabaseReference calendarRef = _databaseReference
        .child('Watch/LatestVideos/MarcMarquezNewBikeFor2024');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchLatesVideosMar2024.clear();

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

            watchLatesVideosMar2024.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchLatesVideosItsTime() async {
    DatabaseReference calendarRef = _databaseReference
        .child('Watch/LatestVideos/ItsTimeForTheAustralianGP2024');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchLatesVideosItsTime.clear();

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

            watchLatesVideosItsTime.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchInterviewsWhenRossi() async {
    DatabaseReference calendarRef = _databaseReference.child(
        'Watch/InterviewsAndReactions/WhenRossiWasBastianinisEnglishTeacher');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchInterviewsWhenRossi.clear();

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

            watchInterviewsWhenRossi.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchInterviewsTop3React() async {
    DatabaseReference calendarRef = _databaseReference
        .child('Watch/InterviewsAndReactions/Top3ReactionToTheRace');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchInterviewsTop3React.clear();

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

            watchInterviewsTop3React.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchInterviewsPodiumTrio() async {
    DatabaseReference calendarRef = _databaseReference.child(
        'Watch/InterviewsAndReactions/PodiumTrioReactsToTheDramaticMotoGPRace');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchInterviewsPodiumTrio.clear();

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

            watchInterviewsPodiumTrio.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchAfterTheFlagPerfect() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/AfterTheFlag/PerfectPeccoRulesTheRing');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchAfterTheFlagPerfect.clear();

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

            watchAfterTheFlagPerfect.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchAfterTheFlagBagnaiaJoins() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/AfterTheFlag/BagnaiaJoinsAnEliteClub');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchAfterTheFlagBagnaiaJoins.clear();

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

            watchAfterTheFlagBagnaiaJoins
                .add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchAfterTheFlagAustrianGP2024() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/AfterTheFlag/AustrianGP2024');

    try {
      DatabaseEvent event = await calendarRef.once();

      DataSnapshot snapshot = event.snapshot;
      // print('from watch2: ${snapshot.value}');
      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchAfterTheFlagAustrianGP2024.clear();

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

            watchAfterTheFlagAustrianGP2024
                .add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchActionClipsBestMotoGP() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/ActionClips/BestMotoGPMoments');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      print('from watch: ${snapshot.value.runtimeType}');

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchActionClipsBestMotoGP.clear();

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

            watchActionClipsBestMotoGP.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchActionClipsotMotoGPRace() async {
    DatabaseReference calendarRef =
        _databaseReference.child('Watch/ActionClips/MotoGPRaceHighlights');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      print('from watch: ${snapshot.value.runtimeType}');

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchActionClipsMotoGPRace.clear();

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

            watchActionClipsBestMotoGP.add(calendarData); // Thêm vào danh sách
          }
        }
      } else {
        print('Dữ liệu không phải là danh sách');
      }
    } catch (e) {
      print('Lỗi khi lấy sự kiện: $e');
    }
  }

  Future<void> fetchWatchActionClipsTheMostMind() async {
    DatabaseReference calendarRef = _databaseReference
        .child('Watch/ActionClips/Themostmind-blowingsavesfromMandalika!');

    try {
      DatabaseEvent event = await calendarRef.once();
      DataSnapshot snapshot = event.snapshot;
      print('from watch: ${snapshot.value.runtimeType}');

      // Kiểm tra nếu snapshot.value là List<Object?>
      if (snapshot.value != null && snapshot.value is List<Object?>) {
        watchActionClipsTheMostMind.clear();

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

            watchActionClipsTheMostMind.add(calendarData); // Thêm vào danh sách
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
