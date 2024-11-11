import 'package:flutter/material.dart';
import 'package:aljabar_project/ctrl.dart';
import 'package:aljabar_project/detailpage.dart';

class HomePageUi extends StatefulWidget {
  const HomePageUi({super.key});

  @override
  State<HomePageUi> createState() => _HomePageUiState();
}

class _HomePageUiState extends State<HomePageUi> {
  final ScrollController _scrollController = ScrollController();
  String golonganDipilih = 'semua';
  String kategoriDipilih = 'semua';
  String tingkatKesulitanDipilih = 'semua';
  String waktuMemasakDipilih = 'semua';

  @override
  void initState() {
    super.initState();
  }

  void _scrollToSchedule() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent / 30,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 200),
          child: Image.asset(
            'assets/images/aljabar-logo.png',
            height: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 2.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/content.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 250.0,
                      top: 250.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 600,
                          child: Text(
                            'BEST FOOD FOR YOUR TASTE',
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFF49B33),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Dari sarapan sampai makan malam, kita punya ide menunya buat kamu!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0XFFA95721),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: _scrollToSchedule,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Makan Sekarang',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Jadwal Makan',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 22),
            Center(
              child: Wrap(
                spacing: 15.0,
                children: ['semua', 'sarapan', 'makan siang', 'makan malam', 'cemilan'].map((kategori) {
                  return ChoiceChip(
                    label: Text(kategori),
                    labelStyle: TextStyle(
                      color: kategoriDipilih == kategori ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: kategoriDipilih == kategori,
                    selectedColor: Colors.orange,
                    backgroundColor: Colors.grey[200],
                    onSelected: (bool selected) {
                      setState(() {
                        kategoriDipilih = kategori;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Waktu Memasak',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                spacing: 15.0,
                children: ['semua', '< 15 menit', '< 30 menit', '< 1 jam'].map((waktuMemasak) {
                  return ChoiceChip(
                    label: Text(waktuMemasak),
                    labelStyle: TextStyle(
                      color: waktuMemasakDipilih == waktuMemasak ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: waktuMemasakDipilih == waktuMemasak,
                    selectedColor: Colors.orange,
                    backgroundColor: Colors.grey[200],
                    onSelected: (bool selected) {
                      setState(() {
                        waktuMemasakDipilih = waktuMemasak;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Tingkat Kesulitan',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                spacing: 15.0,
                children: ['semua', 'mudah', 'sedang', 'sulit'].map((tingkatKesulitan) {
                  return ChoiceChip(
                    label: Text(tingkatKesulitan),
                    labelStyle: TextStyle(
                      color: tingkatKesulitanDipilih == tingkatKesulitan ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: tingkatKesulitanDipilih == tingkatKesulitan,
                    selectedColor: Colors.orange,
                    backgroundColor: Colors.grey[200],
                    onSelected: (bool selected) {
                      setState(() {
                        tingkatKesulitanDipilih = tingkatKesulitan;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Rekomendasi Menu',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                spacing: 15.0,
                children: ['semua', 'nasi', 'mie', 'lauk', 'cemilan'].map((golongan) {
                  return ChoiceChip(
                    label: Text(golongan),
                    labelStyle: TextStyle(
                      color: golonganDipilih == golongan ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: golonganDipilih == golongan,
                    selectedColor: Colors.orange,
                    backgroundColor: Colors.grey[200],
                    onSelected: (bool selected) {
                      setState(() {
                        golonganDipilih = golongan;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 50),
            FutureBuilder(
              future: getColl(
                golongan: golonganDipilih,
                tingkatKesulitan: tingkatKesulitanDipilih,
                kategori: kategoriDipilih,
                waktuMemasak: waktuMemasakDipilih,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<Map<String, dynamic>> menuItems = snapshot.data!.docs.map((doc) {
                    final data = doc.data();
                    final nilaiEigen = calculateNilaiEigen(
                      data['nilaiGizi'] ?? {},
                      data['tingkatKesulitanValue']?.toDouble() ?? 0.0,
                      data['waktuMemasakValue']?.toDouble() ?? 0.0,
                    );
                    return {
                      'id': doc.id,
                      'namaMenu': data['namaMenu'] ?? 'Tanpa Nama',
                      'deskripsi': data['deskripsi'] ?? 'Deskripsi tidak tersedia',
                      'imageUrl': data['imageUrl'] ?? '',
                      'waktuMemasak': data['waktuMemasak'] ?? '',
                      'tingkatKesulitan': data['tingkatKesulitan'] ?? '',
                      'nilaiEigen': nilaiEigen,
                    };
                  }).toList();

                  menuItems.sort((a, b) => b['nilaiEigen'].compareTo(a['nilaiEigen']));

                  return Column(
                    children: menuItems.map((item) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item['imageUrl'].isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    item['imageUrl'],
                                    height: 350,
                                    width: 400,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['namaMenu'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item['deskripsi'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time, color: Colors.orange, size: 20),
                                        const SizedBox(width: 5),
                                        Text(
                                          item['waktuMemasak'],
                                        ),
                                        const SizedBox(width: 16),
                                        const Icon(Icons.bar_chart, color: Colors.orange, size: 20),
                                        const SizedBox(width: 5),
                                        Text(
                                          item['tingkatKesulitan'],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text('Nilai Eigen: ${item['nilaiEigen'].toStringAsFixed(2)}'),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DescPage(namaMenu: item['id']),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Lihat Detail',
                                          style: TextStyle(color: Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return const Center(child: Text('Tidak ada data yang tersedia'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
