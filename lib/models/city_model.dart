class City {
  final String name;
  final String code;
  final String country;

  City({required this.name, required this.code, required this.country});
}

final List<City> availableCities = [
  City(name: 'Jakarta', code: 'CGK', country: 'Indonesia'),
  City(name: 'Bali (Denpasar)', code: 'DPS', country: 'Indonesia'),
  City(name: 'Yogyakarta', code: 'YOG', country: 'Indonesia'),
  City(name: 'Surabaya', code: 'SUB', country: 'Indonesia'),
  City(name: 'Makassar', code: 'UPG', country: 'Indonesia'),
  City(name: 'Medan', code: 'KNO', country: 'Indonesia'),
  City(name: 'Bandung', code: 'BDO', country: 'Indonesia'),
  City(name: 'Lombok', code: 'LOP', country: 'Indonesia'),
  City(name: 'Semarang', code: 'SRG', country: 'Indonesia'),
  City(name: 'Balikpapan', code: 'BPN', country: 'Indonesia'),
  City(name: 'Singapura', code: 'SIN', country: 'Singapura'),
  City(name: 'Kuala Lumpur', code: 'KUL', country: 'Malaysia'),
  City(name: 'Bangkok', code: 'BKK', country: 'Thailand'),
  City(name: 'Tokyo', code: 'NRT', country: 'Jepang'),
];