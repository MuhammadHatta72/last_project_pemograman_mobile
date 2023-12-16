import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/models/ktms.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_helpers/json_helpers.dart';

class KTMData extends ChangeNotifier {

  List<KTMs> overallKTMs = [];

  Future<void> fetchKTMs() async {
    final url = Uri.parse('http://10.0.2.2:5000/read');
    final response = await http.get(url);
    final data = json.decode(response.body);
    final extractedData = data as List<dynamic>;
    final List<KTMs> loadedKTMs = [];
    extractedData.forEach((KTMsData) {
      loadedKTMs.add(KTMs(
        nim: KTMsData['nim'].toString(),
        nama: KTMsData['nama'],
        ttl: KTMsData['ttl'],
        prodi: KTMsData['prodi'],
        alamat1: KTMsData['alamat1'],
        alamat2: KTMsData['alamat2'],
        alamat3: KTMsData['alamat3'],
      ));
    });
    overallKTMs = loadedKTMs;
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
