import 'package:flutter/material.dart';
import 'package:last_project_pemograman_mobile/models/ktps.dart';

class KTPData extends ChangeNotifier{
  List<KTPs> overallKTPs = [
    KTPs(id: '1', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '2', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '3', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '4', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '5', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '6', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '7', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '8', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '9', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
    KTPs(id: '10', nama: 'Aido', nik: '2141720136', dateTime: DateTime.now()),
  ];
  List<KTPs> getAllKTPS() {
    return overallKTPs;
  }

  void addKTPS(KTPs ktps) {
    overallKTPs.add(ktps);
    notifyListeners();
  }

  void removeKTPS(KTPs ktps) {
    overallKTPs.remove(ktps);
    notifyListeners();
  }

  void updateKTPS(KTPs ktps) {
    overallKTPs[overallKTPs.indexWhere((element) => element.id == ktps.id)] = ktps;
    notifyListeners();
  }

  String getWeekdayName(DateTime dateTime) {
    String weekdayName = '';
    switch (dateTime.weekday) {
      case 1:
        weekdayName = 'Senin';
        break;
      case 2:
        weekdayName = 'Selasa';
        break;
      case 3:
        weekdayName = 'Rabu';
        break;
      case 4:
        weekdayName = 'Kamis';
        break;
      case 5:
        weekdayName = 'Jumat';
        break;
      case 6:
        weekdayName = 'Sabtu';
        break;
      case 7:
        weekdayName = 'Minggu';
        break;
    }
    return weekdayName;
  }
}