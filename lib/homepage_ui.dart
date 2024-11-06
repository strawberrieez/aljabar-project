import 'package:flutter/material.dart';
import 'package:aljabar_project/ctrl.dart'; // Import untuk fungsi backend
import 'package:aljabar_project/detailpage.dart'; // Import untuk detail page

class HomePageUi extends StatefulWidget {
  const HomePageUi({super.key});

  @override
  State<HomePageUi> createState() => _HomePageUiState();
}

class _HomePageUiState extends State<HomePageUi> {
  String selectedCategory = 'semua';

  // List untuk mengelola warna tombol
  List<Color> buttonColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  // Nilai untuk slider
  double waktuMemasakValue = 30;
  double tingkatKesulitanValue = 2;

  // Data detail makanan untuk kartu
  final List<Map<String, String>> mealDetails = [
    {
      'icon': 'breakfast_dining',
      'title': 'Sarapan',
      'description':
          'Awali hari dengan pilihan sarapan yang lezat dan bergizi. Temukan menu sempurna yang memberikan energi untuk memulai aktivitas dengan semangat.',
    },
    {
      'icon': 'lunch_dining',
      'title': 'Makan Siang',
      'description':
          'Nikmati makan siang yang mengenyangkan dan penuh rasa. Pilihan menu yang cocok untuk istirahat sejenak dan mengisi tenaga di tengah hari.',
    },
    {
      'icon': 'dinner_dining',
      'title': 'Makan Malam',
      'description':
          'Tutup hari dengan makan malam istimewa yang memanjakan lidah. Temukan sajian yang sempurna untuk dinikmati bersama keluarga atau waktu santai.',
    },
    {
      'icon': 'cake',
      'title': 'Cemilan',
      'description':
          'Manjakan diri dengan aneka camilan ringan yang lezat. Pilihan camilan yang pas untuk menemani aktivitas dan waktu bersantai.',
    },
  ];

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Row(
              children: [
                const SizedBox(
                  width: 250,
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari resep...',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 500,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/food_background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BEST FOOD FOR YOUR TASTE',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Dari sarapan sampai makan malam, kita punya ide menunya buat kamu!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
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
                  spacing: 16.0,
                  runSpacing: 16.0,
                  alignment: WrapAlignment.center,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          buttonColors[index] = Colors.lightBlue.shade50;
                        });
                      },
                      child: Container(
                        width: 300,
                        height: 380,
                        decoration: BoxDecoration(
                          color: buttonColors[index],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.fastfood,
                                size: 40,
                                color: Colors.orange,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                mealDetails[index]['title']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                mealDetails[index]['description']!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Waktu Memasak',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Slider(
                value: waktuMemasakValue,
                min: 0,
                max: 120,
                divisions: 2,
                label: waktuMemasakValue == 0
                    ? '< 15 menit'
                    : waktuMemasakValue == 60
                        ? '30 menit'
                        : '> 1 jam',
                onChanged: (value) {
                  setState(() {
                    waktuMemasakValue = value;
                  });
                },
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('< 15 menit'),
                  Text('30 menit'),
                  Text('> 1 jam'),
                ],
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Tingkat Kesulitan',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Slider(
                value: tingkatKesulitanValue,
                min: 1,
                max: 3,
                divisions: 2,
                label: tingkatKesulitanValue == 1
                    ? 'Mudah'
                    : tingkatKesulitanValue == 2
                        ? 'Sedang'
                        : 'Sulit',
                onChanged: (value) {
                  setState(() {
                    tingkatKesulitanValue = value;
                  });
                },
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mudah'),
                  Text('Sedang'),
                  Text('Sulit'),
                ],
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Rekomendasi Menu',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              FutureBuilder(
                future: getColl(category: selectedCategory),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: List.generate(
                        snapshot.data!.docs.length,
                        (index) {
                          final doc = snapshot.data!.docs[index];
                          final id = doc.id;
                          final namaMenu = doc.data()['namaMenu'];
                          final deskripsi = doc.data()['deskripsi'];
                          final waktu = doc.data()['waktu'] ?? '20 menit';
                          final tingkatKesulitan =
                              doc.data()['tingkatKesulitan'] ?? 'Mudah';
                          final imageUrl = doc.data()['imageUrl'];

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (imageUrl != null && imageUrl.isNotEmpty)
                                  Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: double.infinity,
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        namaMenu,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        deskripsi,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.access_time,
                                                  color: Colors.orange,
                                                  size: 20),
                                              const SizedBox(width: 5),
                                              Text(waktu),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.bar_chart,
                                                  color: Colors.orange,
                                                  size: 20),
                                              const SizedBox(width: 5),
                                              Text(tingkatKesulitan),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DescPage(namaMenu: id),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Lihat Detail',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
