import 'package:flutter/material.dart';
import '../utils/constants.dart';

class PassengerPickerSheet extends StatefulWidget {
  final int initialAdults;
  final int initialChildren;
  final int initialInfants;

  const PassengerPickerSheet({
    Key? key,
    this.initialAdults = 1,
    this.initialChildren = 0,
    this.initialInfants = 0,
  }) : super(key: key);

  @override
  State<PassengerPickerSheet> createState() => _PassengerPickerSheetState();
}

class _PassengerPickerSheetState extends State<PassengerPickerSheet> {
  late int adults;
  late int children;
  late int infants;

  @override
  void initState() {
    super.initState();
    adults = widget.initialAdults;
    children = widget.initialChildren;
    infants = widget.initialInfants;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Jumlah Penumpang',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildPassengerRow(
            title: 'Dewasa',
            subtitle: '(> 12 tahun)',
            value: adults,
            onDecrease: () {
              if (adults > 1) {
                setState(() => adults--);
              }
            },
            onIncrease: () => setState(() => adults++),
          ),
          _buildPassengerRow(
            title: 'Anak',
            subtitle: '(2 - 12 tahun)',
            value: children,
            onDecrease: () {
              if (children > 0) {
                setState(() => children--);
              }
            },
            onIncrease: () => setState(() => children++),
          ),
          _buildPassengerRow(
            title: 'Bayi',
            subtitle: '(< 2 tahun)',
            value: infants,
            onDecrease: () {
              if (infants > 0) {
                setState(() => infants--);
              }
            },
            onIncrease: () {
              if (infants < adults) {
                setState(() => infants++);
              }
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'adults': adults,
                  'children': children,
                  'infants': infants,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassengerRow({
    required String title,
    required String subtitle,
    required int value,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrease,
                icon: const Icon(Icons.remove_circle_outline),
                color: AppColors.primary,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: onIncrease,
                icon: const Icon(Icons.add_circle_outline),
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}