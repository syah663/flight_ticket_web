class Booking {
  final String flightNumber;
  final String airline;
  final String from;
  final String to;
  final String date;
  final String time;
  final double price;
  final String status;

  Booking({
    required this.flightNumber,
    required this.airline,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
  });
}

final List<Booking> recentBookings = [
  Booking(
    flightNumber: 'GA-201',
    airline: 'Garuda Indonesia',
    from: 'CGK',
    to: 'DPS',
    date: '15 Jun 2026',
    time: '08:00',
    price: 1250000,
    status: 'Confirmed',
  ),
  Booking(
    flightNumber: 'JT-502',
    airline: 'Lion Air',
    from: 'CGK',
    to: 'YOG',
    date: '20 Jun 2026',
    time: '14:30',
    price: 850000,
    status: 'Pending',
  ),
  Booking(
    flightNumber: 'IN-303',
    airline: 'Indonesia AirAsia',
    from: 'CGK',
    to: 'SUB',
    date: '25 Jun 2026',
    time: '10:15',
    price: 950000,
    status: 'Confirmed',
  ),
];