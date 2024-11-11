import 'package:aljabar_project/ctrl.dart';
import 'package:flutter/material.dart';

class DescPage extends StatefulWidget {
  final String namaMenu;

  const DescPage({super.key, required this.namaMenu});

  @override
  DescPageState createState() => DescPageState();
}

class DescPageState extends State<DescPage> {
  bool lihatDetail = false;

  void toggleLihatDetail() {
    setState(() {
      lihatDetail = !lihatDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 145),
          child: Image.asset(
            'assets/images/aljabar-logo.png',
            height: 30,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getDoc(widget.namaMenu),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Data tidak ditemukan"));
          }

          var data = snapshot.data!.data();
          if (data == null) {
            return const Center(child: Text("Data tidak valid"));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          data['imageUrl'] != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    data['imageUrl'],
                                    width: 700,
                                    height: 500,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: 250,
                                  color: Colors.grey,
                                  child: const Icon(Icons.image, color: Colors.white, size: 50),
                                ),
                          Column(
                            children: [
                              Text(
                                data['namaMenu'] ?? "Nama Menu",
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${data['waktuMemasak'] ?? '0'} • ${data['tingkatKesulitan'] ?? 'Mudah'}",
                                style: const TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              const SizedBox(height: 16),
                              Text(data['deskripsi'] ?? "Deskripsi tidak tersedia",
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      ListTile(
                        title: const Text("Lihat Detail", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: Icon(lihatDetail ? Icons.expand_less : Icons.expand_more),
                        onTap: toggleLihatDetail,
                      ),
                      if (lihatDetail)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Protein: ${data['nilaiGizi']?['protein'] ?? '0'} g"),
                              Text("Karbohidrat: ${data['nilaiGizi']?['karbohidrat'] ?? '0'} g"),
                              Text("Lemak: ${data['nilaiGizi']?['lemak'] ?? '0'} g"),
                              const SizedBox(height: 16),
                              const Divider(),
                              const Text("Bahan-Bahan:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              if (data['bahan'] is List)
                                for (var item in data['bahan']) Text("• $item", style: const TextStyle(fontSize: 16))
                              else
                                Text(data['bahan'] ?? "Bahan tidak tersedia", style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 16),
                              const Text("Langkah Memasak:",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              if (data['langkahMemasak'] is List)
                                for (var langkah in data['langkahMemasak'])
                                  Text("• $langkah", style: const TextStyle(fontSize: 16))
                              else
                                Text(data['langkahMemasak'] ?? "Langkah memasak tidak tersedia",
                                    style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 16),
                              const Text("Tips Memasak:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              if (data['tipsMemasak'] is List)
                                for (var tip in data['tipsMemasak'])
                                  Text("• $tip", style: const TextStyle(fontSize: 16))
                              else
                                Text(data['tipsMemasak'] ?? "Tips memasak tidak tersedia",
                                    style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Menu Insight",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Lezatnya hidup dimulai dari pilihan yang tepat",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: Colors.orange),
                      SizedBox(width: 8),
                      // Icon(Icons.instagram, color: Colors.orange),
                      // SizedBox(width: 8),
                      // Icon(Icons.twitter, color: Colors.orange),
                      // SizedBox(width: 8),
                      // Icon(Icons.pinterest, color: Colors.orange),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
