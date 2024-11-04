import 'package:aljabar_project/ctrl.dart';
import 'package:aljabar_project/detailpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'semua';

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  items: ['semua', 'sarapan', 'makan siang', 'makan malam', 'cemilan'].map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
                FutureBuilder(
                  future: getColl(category: selectedCategory),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          ...List.generate(
                            snapshot.data!.docs.length,
                            (index) {
                              final id = snapshot.data!.docs[index].id;
                              return Card(
                                child: ListTile(
                                  title: Text(snapshot.data!.docs[index].data()['namaMenu']),
                                  subtitle: Text(snapshot.data!.docs[index].data()['deskripsi']),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DescPage(namaMenu: id),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
