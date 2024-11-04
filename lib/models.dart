import 'dart:convert';

import 'package:flutter/foundation.dart';

class Models{
  final List<String> bahan;
  final String deskripsi;
  final int kalori;
  final String kategori;
  final String namaMenu;
  final Map<String, int> nilaiGizi;
  final String tingkatKesulitan;
  final int waktuMemasak;
  final String idMenu;
  final List<String> langkahMemasak;
  final String tipsMemasak;
  final String idMenuDipilih;
  final String idUser;
  final int rating;
  final DateTime tanggalPemilihan;
  final String batasKalori;
  final List<String> kategoriMakananDisukai;
  final String tingkatKesulitanDiinginkan;
  final int waktuMasakDiinginkan;
  final String idCluster;
  final List<String> idMenus;
  final String preferensiUtama;
  final List<String> vektorEigen;
  Models({
    this.bahan = const [],
    this.deskripsi = '',
    this.kalori = 0,
    this.kategori = '',
    this.namaMenu = '',
    this.nilaiGizi = const {},
    this.tingkatKesulitan = '',
    this.waktuMemasak = 0,
    this.idMenu = '',
    this.langkahMemasak = const [],
    this.tipsMemasak = '',
    this.idMenuDipilih = '',
    this.idUser = '',
    this.rating = 0,
    required this.tanggalPemilihan,
    this.batasKalori = '',
    this.kategoriMakananDisukai = const [],
    this.tingkatKesulitanDiinginkan = '',
    this.waktuMasakDiinginkan = 0,
    this.idCluster = '',
    this.idMenus = const [],
    this.preferensiUtama = '',
    this.vektorEigen = const [],
  });

  Models copyWith({
    List<String>? bahan,
    String? deskripsi,
    int? kalori,
    String? kategori,
    String? namaMenu,
    Map<String, int>? nilaiGizi,
    String? tingkatKesulitan,
    int? waktuMemasak,
    String? idMenu,
    List<String>? langkahMemasak,
    String? tipsMemasak,
    String? idMenuDipilih,
    String? idUser,
    int? rating,
    DateTime? tanggalPemilihan,
    String? batasKalori,
    List<String>? kategoriMakananDisukai,
    String? tingkatKesulitanDiinginkan,
    int? waktuMasakDiinginkan,
    String? idCluster,
    List<String>? idMenus,
    String? preferensiUtama,
    List<String>? vektorEigen,
  }) {
    return Models(
      bahan: bahan ?? this.bahan,
      deskripsi: deskripsi ?? this.deskripsi,
      kalori: kalori ?? this.kalori,
      kategori: kategori ?? this.kategori,
      namaMenu: namaMenu ?? this.namaMenu,
      nilaiGizi: nilaiGizi ?? this.nilaiGizi,
      tingkatKesulitan: tingkatKesulitan ?? this.tingkatKesulitan,
      waktuMemasak: waktuMemasak ?? this.waktuMemasak,
      idMenu: idMenu ?? this.idMenu,
      langkahMemasak: langkahMemasak ?? this.langkahMemasak,
      tipsMemasak: tipsMemasak ?? this.tipsMemasak,
      idMenuDipilih: idMenuDipilih ?? this.idMenuDipilih,
      idUser: idUser ?? this.idUser,
      rating: rating ?? this.rating,
      tanggalPemilihan: tanggalPemilihan ?? this.tanggalPemilihan,
      batasKalori: batasKalori ?? this.batasKalori,
      kategoriMakananDisukai: kategoriMakananDisukai ?? this.kategoriMakananDisukai,
      tingkatKesulitanDiinginkan: tingkatKesulitanDiinginkan ?? this.tingkatKesulitanDiinginkan,
      waktuMasakDiinginkan: waktuMasakDiinginkan ?? this.waktuMasakDiinginkan,
      idCluster: idCluster ?? this.idCluster,
      idMenus: idMenus ?? this.idMenus,
      preferensiUtama: preferensiUtama ?? this.preferensiUtama,
      vektorEigen: vektorEigen ?? this.vektorEigen,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'bahan': bahan});
    result.addAll({'deskripsi': deskripsi});
    result.addAll({'kalori': kalori});
    result.addAll({'kategori': kategori});
    result.addAll({'nama_menu': namaMenu});
    result.addAll({'nilai_gizi': nilaiGizi});
    result.addAll({'tingkat_kesulitan': tingkatKesulitan});
    result.addAll({'waktu_memasak': waktuMemasak});
    result.addAll({'id_menu': idMenu});
    result.addAll({'langkah_memasak': langkahMemasak});
    result.addAll({'tips_memasak': tipsMemasak});
    result.addAll({'id_menu_dipilih': idMenuDipilih});
    result.addAll({'id_user': idUser});
    result.addAll({'rating': rating});
    result.addAll({'tanggal_pemilihan': tanggalPemilihan.millisecondsSinceEpoch});
    result.addAll({'batas_kalori': batasKalori});
    result.addAll({'kategori_makanan_disukai': kategoriMakananDisukai});
    result.addAll({'tingkat_kesulitan_diinginkan': tingkatKesulitanDiinginkan});
    result.addAll({'waktu_masak_diinginkan': waktuMasakDiinginkan});
    result.addAll({'id_cluster': idCluster});
    result.addAll({'id_menus': idMenus});
    result.addAll({'preferensi_utama': preferensiUtama});
    result.addAll({'vektor_eigen': vektorEigen});
  
    return result;
  }

  factory Models.fromMap(Map<String, dynamic> map) {
    return Models(
      bahan: List<String>.from(map['bahan'] ?? const []),
      deskripsi: map['deskripsi'] ?? '',
      kalori: map['kalori']?.toInt() ?? 0,
      kategori: map['kategori'] ?? '',
      namaMenu: map['nama_menu'] ?? '',
      nilaiGizi: Map<String, int>.from(map['nilai_gizi'] ?? const {}),
      tingkatKesulitan: map['tingkat_kesulitan'] ?? '',
      waktuMemasak: map['waktu_memasak']?.toInt() ?? 0,
      idMenu: map['id_menu'] ?? '',
      langkahMemasak: List<String>.from(map['langkah_memasak'] ?? const []),
      tipsMemasak: map['tips_memasak'] ?? '',
      idMenuDipilih: map['id_menu_dipilih'] ?? '',
      idUser: map['id_user'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      tanggalPemilihan: DateTime.fromMillisecondsSinceEpoch(map['tanggal_pemilihan']),
      batasKalori: map['batas_kalori'] ?? '',
      kategoriMakananDisukai: List<String>.from(map['kategori_makanan_disukai'] ?? const []),
      tingkatKesulitanDiinginkan: map['tingkat_kesulitan_diinginkan'] ?? '',
      waktuMasakDiinginkan: map['waktu_masak_diinginkan']?.toInt() ?? 0,
      idCluster: map['id_cluster'] ?? '',
      idMenus: List<String>.from(map['id_menus'] ?? const []),
      preferensiUtama: map['preferensi_utama'] ?? '',
      vektorEigen: List<String>.from(map['vektor_eigen'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Models.fromJson(String source) => Models.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Models(bahan: $bahan, deskripsi: $deskripsi, kalori: $kalori, kategori: $kategori, namaMenu: $namaMenu, nilaiGizi: $nilaiGizi, tingkatKesulitan: $tingkatKesulitan, waktuMemasak: $waktuMemasak, idMenu: $idMenu, langkahMemasak: $langkahMemasak, tipsMemasak: $tipsMemasak, idMenuDipilih: $idMenuDipilih, idUser: $idUser, rating: $rating, tanggalPemilihan: $tanggalPemilihan, batasKalori: $batasKalori, kategoriMakananDisukai: $kategoriMakananDisukai, tingkatKesulitanDiinginkan: $tingkatKesulitanDiinginkan, waktuMasakDiinginkan: $waktuMasakDiinginkan, idCluster: $idCluster, idMenus: $idMenus, preferensiUtama: $preferensiUtama, vektorEigen: $vektorEigen)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Models &&
      listEquals(other.bahan, bahan) &&
      other.deskripsi == deskripsi &&
      other.kalori == kalori &&
      other.kategori == kategori &&
      other.namaMenu == namaMenu &&
      mapEquals(other.nilaiGizi, nilaiGizi) &&
      other.tingkatKesulitan == tingkatKesulitan &&
      other.waktuMemasak == waktuMemasak &&
      other.idMenu == idMenu &&
      listEquals(other.langkahMemasak, langkahMemasak) &&
      other.tipsMemasak == tipsMemasak &&
      other.idMenuDipilih == idMenuDipilih &&
      other.idUser == idUser &&
      other.rating == rating &&
      other.tanggalPemilihan == tanggalPemilihan &&
      other.batasKalori == batasKalori &&
      listEquals(other.kategoriMakananDisukai, kategoriMakananDisukai) &&
      other.tingkatKesulitanDiinginkan == tingkatKesulitanDiinginkan &&
      other.waktuMasakDiinginkan == waktuMasakDiinginkan &&
      other.idCluster == idCluster &&
      listEquals(other.idMenus, idMenus) &&
      other.preferensiUtama == preferensiUtama &&
      listEquals(other.vektorEigen, vektorEigen);
  }

  @override
  int get hashCode {
    return bahan.hashCode ^
      deskripsi.hashCode ^
      kalori.hashCode ^
      kategori.hashCode ^
      namaMenu.hashCode ^
      nilaiGizi.hashCode ^
      tingkatKesulitan.hashCode ^
      waktuMemasak.hashCode ^
      idMenu.hashCode ^
      langkahMemasak.hashCode ^
      tipsMemasak.hashCode ^
      idMenuDipilih.hashCode ^
      idUser.hashCode ^
      rating.hashCode ^
      tanggalPemilihan.hashCode ^
      batasKalori.hashCode ^
      kategoriMakananDisukai.hashCode ^
      tingkatKesulitanDiinginkan.hashCode ^
      waktuMasakDiinginkan.hashCode ^
      idCluster.hashCode ^
      idMenus.hashCode ^
      preferensiUtama.hashCode ^
      vektorEigen.hashCode;
  }
}
