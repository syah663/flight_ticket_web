class Destination {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final String duration;

  Destination({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.duration,
  });
}

final List<Destination> popularDestinations = [
  Destination(
    name: 'Bali',
    code: 'DPS',
    imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=500',
    price: 1250000,
    duration: '2j 15m',
  ),
  Destination(
    name: 'Yogyakarta',
    code: 'YOG',
    imageUrl: 'https://images.unsplash.com/photo-1584810359583-96fc9f6b1e3f?w=500',
    price: 850000,
    duration: '1j 30m',
  ),
  Destination(
    name: 'Lombok',
    code: 'LOP',
    imageUrl: 'https://images.unsplash.com/photo-1570789210967-2cac24ba04c0?w=500',
    price: 1100000,
    duration: '2j 00m',
  ),
  Destination(
    name: 'Surabaya',
    code: 'SUB',
    imageUrl: 'https://images.unsplash.com/photo-1555899434-94d1368aa7af?w=500',
    price: 950000,
    duration: '1j 45m',
  ),
];