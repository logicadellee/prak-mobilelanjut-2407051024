import 'package:flutter/material.dart';

class MenuBulat extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color warna1;
  final Color warna2;
  final VoidCallback? onTap;
  final double skala; 

  const MenuBulat({
    super.key,
    required this.label,
    required this.icon,
    required this.warna1,
    required this.warna2,
    this.onTap,
    this.skala = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 71 * skala,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 58 * skala,
              height: 58 * skala,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [warna1, warna2],
                ),
              ),
              child: Icon(icon, color: Colors.white, size: 30 * skala),
            ),
            const SizedBox(height: 8),
            Text(label,
                style: const TextStyle(fontSize: 13, color: Color(0xFF1F2A44))),
          ],
        ),
      ),
    );
  }
}

// banner iklan 
class IklanBanner extends StatelessWidget {
  const IklanBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: 118,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Transform.scale(
          scale: 1.04,
          child: Image.asset(
            'assets/images/iklan_81.png',
            width: double.infinity,
            height: 118,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}