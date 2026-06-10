import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../screens/checkin_screen.dart';
import '../screens/promo_screen.dart';
import '../screens/search_result_screen.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Layanan Penerbangan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionItem(
              context: context,
              icon: Icons.flight_rounded,
              label: 'Domestik',
              color: AppColors.primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchResultScreen(
                      fromCity: 'Jakarta',
                      fromCode: 'CGK',
                      toCity: 'Bali',
                      toCode: 'DPS',
                      date: 'Hari ini',
                      passengers: 1,
                    ),
                  ),
                );
              },
            ),
            _buildActionItem(
              context: context,
              icon: Icons.public_rounded,
              label: 'Internasional',
              color: Colors.purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchResultScreen(
                      fromCity: 'Jakarta',
                      fromCode: 'CGK',
                      toCity: 'Singapura',
                      toCode: 'SIN',
                      date: 'Hari ini',
                      passengers: 1,
                    ),
                  ),
                );
              },
            ),
            _buildActionItem(
              context: context,
              icon: Icons.qr_code_rounded,
              label: 'Cek-in',
              color: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckinScreen(),
                  ),
                );
              },
            ),
            _buildActionItem(
              context: context,
              icon: Icons.local_offer_rounded,
              label: 'Promo',
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PromoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}