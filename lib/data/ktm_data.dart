// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/models/ktms.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:last_project_pemograman_mobile/config/config.dart';

class KTMData extends ChangeNotifier {
  List<KTMs> overallKTMs = [];

  Future<void> fetchKTMs() async {
    final url = Uri.parse('${Config.BASE_URL}/read');
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      final extractedData = data as List<dynamic>;
      final List<KTMs> loadedKTMs = [];
      for (var KTMsData in extractedData) {
        loadedKTMs.add(KTMs(
          nim: KTMsData['nim'].toString(),
          nama: KTMsData['nama'],
          ttl: KTMsData['ttl'],
          prodi: KTMsData['prodi'],
          alamat1: KTMsData['alamat1'],
          alamat2: KTMsData['alamat2'],
          alamat3: KTMsData['alamat3'],
        ));
      }
      overallKTMs = loadedKTMs;
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  List<KTMs> getAllKTMS() {
    fetchKTMs();
    return overallKTMs;
  }

  void addKTMS(KTMs KTMs) {
    overallKTMs.add(KTMs);
    notifyListeners();
  }

  void removeKTMS(KTMs KTMs) {
    overallKTMs.remove(KTMs);
    notifyListeners();
  }

  void updateKTMS(KTMs KTMs) {
    overallKTMs[overallKTMs.indexWhere((element) => element.nim == KTMs.nim)] =
        KTMs;
    notifyListeners();
  }
}
