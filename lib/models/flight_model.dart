class Flight {
  final String flightNumber;
  final String airline;
  final String airlineLogo;
  final String fromCode;
  final String fromCity;
  final String toCode;
  final String toCity;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final double price;
  final String aircraft;
  final String cabinClass;
  final int availableSeats;

  Flight({
    required this.flightNumber,
    required this.airline,
    required this.airlineLogo,
    required this.fromCode,
    required this.fromCity,
    required this.toCode,
    required this.toCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
    required this.aircraft,
    required this.cabinClass,
    required this.availableSeats,
  });
}

// Data dummy hasil pencarian
List<Flight> searchFlights(String from, String to) {
  return [
    Flight(
      flightNumber: 'GA-201',
      airline: 'Garuda Indonesia',
      airlineLogo: '🛫',
      fromCode: from,
      fromCity: 'Jakarta',
      toCode: to,
      toCity: 'Bali',
      departureTime: '08:00',
      arrivalTime: '10:15',
      duration: '2j 15m',
      price: 1250000,
      aircraft: 'Boeing 737-800',
      cabinClass: 'Ekonomi',
      availableSeats: 45,
    ),
    Flight(
      flightNumber: 'JT-502',
      airline: 'Lion Air',
      airlineLogo: '🦁',
      fromCode: from,
      fromCity: 'Jakarta',
      toCode: to,
      toCity: 'Bali',
      departureTime: '10:30',
      arrivalTime: '12:45',
      duration: '2j 15m',
      price: 850000,
      aircraft: 'Boeing 737-900ER',
      cabinClass: 'Ekonomi',
      availableSeats: 12,
    ),
    Flight(
      flightNumber: 'IN-303',
      airline: 'Indonesia AirAsia',
      airlineLogo: '🔴',
      fromCode: from,
      fromCity: 'Jakarta',
      toCode: to,
      toCity: 'Bali',
      departureTime: '14:15',
      arrivalTime: '16:30',
      duration: '2j 15m',
      price: 950000,
      aircraft: 'Airbus A320',
      cabinClass: 'Ekonomi',
      availableSeats: 28,
    ),
    Flight(
      flightNumber: 'GA-205',
      airline: 'Garuda Indonesia',
      airlineLogo: '🛫',
      fromCode: from,
      fromCity: 'Jakarta',
      toCode: to,
      toCity: 'Bali',
      departureTime: '18:00',
      arrivalTime: '20:15',
      duration: '2j 15m',
      price: 1350000,
      aircraft: 'Boeing 737-800',
      cabinClass: 'Ekonomi',
      availableSeats: 60,
    ),
  ];
}