import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Row'),
      ), // AppBar
      body: const Row(
        children: [
          Text('D3 Manajemen Informatika '),
          Text('FMIPA '),
          Text('Universitas Lampung '),
          Text('2026'),
        ],
      ), // Row
    ); // Scaffold
  }
}