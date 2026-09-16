import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Column'),
      ), // AppBar
      body: const Column(
        children: [
          Text('D3 Manajemen Informatika'),
          Text('Fakultas Matematika dan Ilmu Pengetahuan Alam'),
          Text('Universitas Lampung'),
          Text('2026'),
        ],
      ), // Column
    ); // Scaffold
  }
}