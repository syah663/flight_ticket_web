import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'search_result_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cari Penerbangan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari kota atau kode bandara...',
                  prefixIcon: const Icon(Icons.flight_takeoff_rounded),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Rute Populer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    _buildSearchItem(
                      context,
                      'Jakarta (CGK) ke Bali (DPS)',
                      'Jakarta', 'CGK', 'Bali', 'DPS',
                    ),
                    _buildSearchItem(
                      context,
                      'Jakarta (CGK) ke Yogyakarta (YOG)',
                      'Jakarta', 'CGK', 'Yogyakarta', 'YOG',
                    ),
                    _buildSearchItem(
                      context,
                      'Surabaya (SUB) ke Makassar (UPG)',
                      'Surabaya', 'SUB', 'Makassar', 'UPG',
                    ),
                    _buildSearchItem(
                      context,
                      'Jakarta (CGK) ke Singapura (SIN)',
                      'Jakarta', 'CGK', 'Singapura', 'SIN',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchItem(
    BuildContext context,
    String text,
    String fromCity,
    String fromCode,
    String toCity,
    String toCode,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultScreen(
              fromCity: fromCity,
              fromCode: fromCode,
              toCity: toCity,
              toCode: toCode,
              date: 'Hari ini',
              passengers: 1,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.flight_rounded,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}