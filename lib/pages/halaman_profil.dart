import 'package:flutter/material.dart';

class Anggota {
  final String nama;
  final String ttl;
  final String alamat;
  final String imagePath;

  Anggota({
    required this.nama,
    required this.ttl,
    required this.alamat,
    required this.imagePath,
  });
}

class HalamanProfil extends StatelessWidget {
  final List<Anggota> anggota = [
    Anggota(
      nama: 'Fitri Atika Salwa',
      ttl: 'Bandar Lampung, 29 November 2003',
      alamat: 'Depok',
      imagePath: 'assets/images/anggota1.jpg',
    ),
    Anggota(
      nama: 'Gina Annisa',
      ttl: 'Tangerang, 22 Oktober 2004',
      alamat: 'Bekasi',
      imagePath: 'assets/images/anggota2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF5F8),
      appBar: AppBar(
        title: Text('Profil Tim'),
        backgroundColor: Color(0xFFE5B8F4),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: anggota.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final a = anggota[index];
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withAlpha(51),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    a.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        a.nama,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[800],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        a.ttl,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      Text(
                        a.alamat,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
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
