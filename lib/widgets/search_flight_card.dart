import 'package:flutter/material.dart';
import '../models/city_model.dart';
import '../utils/constants.dart';
import '../widgets/city_picker_dialog.dart';
import '../widgets/passenger_picker_sheet.dart';
import '../screens/search_result_screen.dart';

class SearchFlightCard extends StatefulWidget {
  const SearchFlightCard({Key? key}) : super(key: key);

  @override
  State<SearchFlightCard> createState() => _SearchFlightCardState();
}

class _SearchFlightCardState extends State<SearchFlightCard> {
  City? _fromCity = City(name: 'Jakarta', code: 'CGK', country: 'Indonesia');
  City? _toCity = City(name: 'Bali (Denpasar)', code: 'DPS', country: 'Indonesia');
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 7));
  int _adults = 1;
  int _children = 0;
  int _infants = 0;

  void _swapCities() {
    setState(() {
      final temp = _fromCity;
      _fromCity = _toCity;
      _toCity = temp;
    });
  }

  Future<void> _pickCity(bool isFrom) async {
    final result = await showDialog<City>(
      context: context,
      builder: (context) => CityPickerDialog(
        title: isFrom ? 'Pilih Kota Asal' : 'Pilih Kota Tujuan',
      ),
    );
    if (result != null) {
      setState(() {
        if (isFrom) {
          _fromCity = result;
        } else {
          _toCity = result;
        }
      });
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickPassengers() async {
    final result = await showModalBottomSheet<Map<String, int>>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => PassengerPickerSheet(
        initialAdults: _adults,
        initialChildren: _children,
        initialInfants: _infants,
      ),
    );
    if (result != null) {
      setState(() {
        _adults = result['adults']!;
        _children = result['children']!;
        _infants = result['infants']!;
      });
    }
  }

  void _searchFlights() {
    if (_fromCity == null || _toCity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih kota asal dan tujuan')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultScreen(
          fromCity: _fromCity!.name,
          fromCode: _fromCity!.code,
          toCity: _toCity!.name,
          toCode: _toCity!.code,
          date: _formatDate(_selectedDate),
          passengers: _adults + _children + _infants,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _getPassengerText() {
    final parts = <String>[];
    if (_adults > 0) parts.add('$_adults Dewasa');
    if (_children > 0) parts.add('$_children Anak');
    if (_infants > 0) parts.add('$_infants Bayi');
    return parts.isEmpty ? '1 Dewasa' : parts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cari Penerbangan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _pickCity(true),
                  child: _buildLocationField(
                    icon: Icons.flight_takeoff_rounded,
                    label: 'Dari',
                    value: _fromCity != null
                        ? '${_fromCity!.name} (${_fromCity!.code})'
                        : 'Pilih Kota',
                  ),
                ),
              ),
              GestureDetector(
                onTap: _swapCities,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.swap_horiz_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => _pickCity(false),
                  child: _buildLocationField(
                    icon: Icons.flight_land_rounded,
                    label: 'Ke',
                    value: _toCity != null
                        ? '${_toCity!.name} (${_toCity!.code})'
                        : 'Pilih Kota',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _pickDate,
                  child: _buildDateField(
                    icon: Icons.calendar_today_rounded,
                    label: 'Tanggal',
                    value: _formatDate(_selectedDate),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: _pickPassengers,
                  child: _buildPassengerField(
                    icon: Icons.people_rounded,
                    label: 'Penumpang',
                    value: _getPassengerText(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _searchFlights,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Cari Penerbangan',
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

  Widget _buildLocationField({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassengerField({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}