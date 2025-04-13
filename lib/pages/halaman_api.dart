import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';

class University {
  final String name;
  final String country;

  University({required this.name, required this.country});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(name: json['name'], country: json['country']);
  }
}

class HalamanApi extends StatefulWidget {
  @override
  _HalamanApiState createState() => _HalamanApiState();
}

class _HalamanApiState extends State<HalamanApi> {
  List<University> universities = [];

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://universities.hipolabs.com/search?country=Indonesia'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        universities = data.map((u) => University.fromJson(u)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF5F8),
      appBar: AppBar(
        title: Text('Universitas di Indonesia'),
        backgroundColor: Color(0xFFE5B8F4),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body:
          universities.isEmpty
              ? Center(child: CircularProgressIndicator(color: Colors.purple))
              : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: universities.length,
                itemBuilder: (context, index) {
                  final university = universities[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple[100],
                        child: Icon(
                          Iconsax.building_3,
                          color: Colors.deepPurple,
                        ),
                      ),
                      title: Text(
                        university.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        university.country,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
