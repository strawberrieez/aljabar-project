import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getColl({
  String golongan = 'semua',
  String kategori = 'semua',
  String tingkatKesulitan = 'semua',
  String waktuMemasak = 'semua',
}) async {
  CollectionReference<Map<String, dynamic>> menuCollection =
      FirebaseFirestore.instance.collection('Menu').withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) => snapshot.data()!,
            toFirestore: (data, _) => data,
          );

  Query<Map<String, dynamic>> query = menuCollection;

  if (golongan != 'semua') {
    query = query.where('golongan', isEqualTo: golongan);
  }

  if (kategori != 'semua') {
    query = query.where('kategori', isEqualTo: kategori);
  }

  if (tingkatKesulitan != 'semua') {
    query = query.where('tingkatKesulitan', isEqualTo: tingkatKesulitan);
  }

  if (waktuMemasak != 'semua') {
    query = query.where('waktuMemasak', isEqualTo: waktuMemasak);
  }

  return await query.get();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('Menu').doc(id).get();

  return result;
}

double calculateNilaiEigen(Map<String, dynamic> nilaiGizi, double tingkatKesulitanValue, double waktuMemasakValue) {
  double karbohidrat = nilaiGizi['karbohidrat'] ?? 0.0;
  double lemak = nilaiGizi['lemak'] ?? 0.0;
  double protein = nilaiGizi['protein'] ?? 0.0;
  double tingkatKesulitan = tingkatKesulitanValue;
  double waktuMemasak = waktuMemasakValue;

  final totalGizi = (karbohidrat * 0.4) + (lemak * 0.3) + (protein * 0.3);

  return (totalGizi * 0.4) + (tingkatKesulitan * 0.3) + (waktuMemasak * 0.3);
}
