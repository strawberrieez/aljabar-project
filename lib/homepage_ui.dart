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
  String selectedCategory = 'semua';

  List<Color> buttonColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  double waktuMemasakValue = 30;
  double tingkatKesulitanValue = 2;

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
              max: 60,
              divisions: 12,
              label: waktuMemasakValue == 0
                  ? '< 5 menit'
                  : waktuMemasakValue == 5
                      ? '5 menit'
                      : waktuMemasakValue == 10
                          ? '10 menit'
                          : waktuMemasakValue == 15
                              ? '15 menit'
                              : waktuMemasakValue == 20
                                  ? '20 menit'
                                  : waktuMemasakValue == 25
                                      ? '25 menit'
                                      : waktuMemasakValue == 30
                                          ? '30 menit'
                                          : waktuMemasakValue == 35
                                              ? '35 menit'
                                              : waktuMemasakValue == 40
                                                  ? '40 menit'
                                                  : waktuMemasakValue == 45
                                                      ? '45 menit'
                                                      : waktuMemasakValue == 50
                                                          ? '50 menit'
                                                          : waktuMemasakValue == 55
                                                              ? '55 menit'
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
                Text('< 5 menit'),
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
                  ? 'mudah'
                  : tingkatKesulitanValue == 2
                      ? 'sedang'
                      : 'sulit',
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
                Text('mudah'),
                Text('sedang'),
                Text('sulit'),
              ],
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Rekomendasi Menu',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            // Tambahkan kode ini di bawah teks "Rekomendasi Menu"
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                spacing: 15.0,
                children: ['semua', 'nasi', 'mie', 'lauk', 'cemilan'].map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    labelStyle: TextStyle(
                      color: selectedCategory == category ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    selected: selectedCategory == category,
                    selectedColor: Colors.orange,
                    backgroundColor: Colors.grey[200],
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),

            const SizedBox(height: 50),
            FutureBuilder(
              future: getColl(
                category: selectedCategory,
                waktuMemasak: waktuMemasakValue,
              ),
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
                        final waktu = doc.data()['waktuMemasak'].toString();
                        final tingkatKesulitan = doc.data()['tingkatKesulitan'] ?? '-';
                        final imageUrl = doc.data()['imageUrl'];
                        final nilaiGizi = doc.data()['nilaiGizi'];

                        double giziScore = calculateGiziScore(nilaiGizi);

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Gambar di kiri
                                if (imageUrl != null && imageUrl.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      imageUrl,
                                      height: 350,
                                      width: 400,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                const SizedBox(width: 16), // Jarak antara gambar dan deskripsi
                                // Teks deskripsi di kanan
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(Icons.access_time, color: Colors.orange, size: 20),
                                          const SizedBox(width: 5),
                                          Text(waktu),
                                          const SizedBox(width: 16),
                                          const Icon(Icons.bar_chart, color: Colors.orange, size: 20),
                                          const SizedBox(width: 5),
                                          Text(tingkatKesulitan),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(Icons.score, color: Colors.orange, size: 20),
                                          const SizedBox(width: 5),
                                          Text('Gizi Score: ${giziScore.toStringAsFixed(1)}'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DescPage(namaMenu: id),
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
                      },
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
