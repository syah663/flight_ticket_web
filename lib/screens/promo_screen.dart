import 'package:flutter/material.dart';
import '../utils/constants.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final promos = [
      {
        'title': 'Diskon 30% Domestik',
        'code': 'DOMESTIK30',
        'desc': 'Berlaku untuk semua penerbangan domestik',
        'color': Colors.blue,
      },
      {
        'title': 'Potongan 500K',
        'code': 'HEMAT500',
        'desc': 'Min. transaksi Rp 2.000.000',
        'color': Colors.orange,
      },
      {
        'title': 'Gratis Bagasi 30kg',
        'code': 'BAGASI30',
        'desc': 'Khusus penerbangan internasional',
        'color': Colors.purple,
      },
      {
        'title': 'Cashback 20%',
        'code': 'CASHBACK20',
        'desc': 'Maks. cashback Rp 500.000',
        'color': Colors.green,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Promo Spesial'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: promos.length,
        itemBuilder: (context, index) {
          final promo = promos[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  (promo['color'] as Color).withOpacity(0.8),
                  (promo['color'] as Color),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: (promo['color'] as Color).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promo['title'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  promo['desc'] as String,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        promo['code'] as String,
                        style: TextStyle(
                          color: promo['color'] as Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Kode ${promo['code']} berhasil disalin!',
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.copy_rounded,
                          color: promo['color'] as Color,
                          size: 18,
                        ),
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