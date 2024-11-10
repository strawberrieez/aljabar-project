import 'package:aljabar_project/ctrl.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescPage extends StatelessWidget {
  DescPage({super.key, required this.namaMenu});

  final String namaMenu;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      // body: FutureBuilder(
      //   future: getDoc(namaMenu),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: const Icon(Icons.favorite),
      //           ),
      //           Text(snapshot.data!.data()!['namaMenu'].toString()),
      //           Text(snapshot.data!.data()!['bahan'].toString()),
      //           Text(snapshot.data!.data()!['langkahMemasak'].toString()),
      //           Text(snapshot.data!.data()!['tipsMemasak'].toString()),
      //           Text(snapshot.data!.data()!['nilaiGizi'].toString()),
      //         ],
      //       );
      //     }
      //     return const Center(child: CircularProgressIndicator());
      //   },
      // ),
    );
  }
}
