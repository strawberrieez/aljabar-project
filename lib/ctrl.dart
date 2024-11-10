import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getColl({
  String category = 'semua',
  double? waktuMemasak,
}) async {
  CollectionReference<Map<String, dynamic>> menuCollection =
      FirebaseFirestore.instance.collection('Menu').withConverter<Map<String, dynamic>>(
        fromFirestore: (snapshot, _) => snapshot.data()!,
        toFirestore: (data, _) => data,
      );

  // Filter kategori (golongan)
  Query<Map<String, dynamic>> query = 
      category == 'semua' ? menuCollection : menuCollection.where('golongan', isEqualTo: category);

  // Filter waktuMemasak
  if (waktuMemasak != null) {
    if (waktuMemasak == 0) {
      // < 15 menit
      query = query.where('waktuMemasak', isLessThanOrEqualTo: 15);
    } else if (waktuMemasak == 60) {
      // 15 hingga 60 menit
      query = query
          .where('waktuMemasak', isGreaterThanOrEqualTo: 15)
          .where('waktuMemasak', isLessThanOrEqualTo: 60);
    } else if (waktuMemasak == 120) {
      // > 60 menit
      query = query.where('waktuMemasak', isGreaterThanOrEqualTo: 60);
    }
  }

  // Mengembalikan hasil query
  return query.get();
}



Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('Menu').doc(id).get();

  return result;
}

double calculateGiziScore(Map<String, dynamic> nilaiGizi) {
  double karbohidrat = nilaiGizi['karbohidrat'] ?? 0.0;
  double lemak = nilaiGizi['lemak'] ?? 0.0;
  double protein = nilaiGizi['protein'] ?? 0.0;

  const karbohidratWeight = 0.4;
  const lemakWeight = 0.3;
  const proteinWeight = 0.3;

  return (karbohidrat * karbohidratWeight) + (lemak * lemakWeight) + (protein * proteinWeight);
}

// Widget displayImage(String? imageUrl) {
//   if (imageUrl != null && imageUrl.isNotEmpty) {
//     return Image.network(
//       imageUrl,
//       fit: BoxFit.cover,
//       height: 20,
//       width: 20,
//     );
//   } else {
//     return const SizedBox();
//   }
// }

// Future<String> getImageUrl(String imageName) async {
//   try {
//     // Mendapatkan referensi ke file gambar
//     final Reference storageReference = FirebaseStorage.instance.ref().child('images/$imageName');

//     // Mendapatkan URL gambar dari Firebase Storage
//     String imageUrl = await storageReference.getDownloadURL();

//     return imageUrl;
//   } catch (e) {
//     ("Error loading image: $e");
//     return '';
//   }
// }

// Future<String> getImageUrl(String imageName) async {
//   try {
//     // Mendapatkan referensi ke file gambar
//     final ref = FirebaseStorage.instance.ref().child('images/$imageName');
//     // Mengambil URL gambar
//     final url = await ref.getDownloadURL();
//     return url;
//   } catch (e) {
//     ("Error fetching image: $e");
//     return ''; // Mengembalikan string kosong jika terjadi error
//   }
// }

// Future<String> getImageUrl(String imageName) async {
//   // Asumsi menggunakan Firebase Storage untuk mengambil URL gambar
//   try {
//     final ref = FirebaseStorage.instance.ref().child('images/$imageName');
//     final url = await ref.getDownloadURL(); // Mengambil URL gambar
//     return url;
//   } catch (e) {
//     // Jika gagal, kembalikan URL default atau error handling
//     return 'https://via.placeholder.com/150'; // URL gambar placeholder
//   }
// }

// Future<String> getImageUrl(String imageName) async {
//   final ref = FirebaseStorage.instance.ref().child('images/$imageName');
//   return await ref.getDownloadURL();
// }
