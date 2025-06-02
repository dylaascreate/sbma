import 'package:flutter/material.dart';
import 'space_details_page.dart';

class SpacesPage extends StatefulWidget {
  const SpacesPage({super.key});

  @override
  State<SpacesPage> createState() => _SpacesPageState();
}

class _SpacesPageState extends State<SpacesPage> {
  String selectedCategory = 'all';

  final List<Map<String, String>> spaceCatalogs = [
    {//hall
      'name': 'MAIN CONFERENCE ROOM',
      'description': '½ Day (6 Hour): RM375.00 | 1 Day (24 Hour): RM500.00',
      'category': 'hall',
       'image': 'assets/images/mesyuarat_canselori.jpg',
    },
    {
      'name': 'MAIN MEETING ROOM',
      'description': '½ Day (6 Hour): RM225.00 | 1 Day (24 Hour): RM300.00',
      'category': 'hall',
       'image': 'assets/images/mesyuarat_suluhbudiman.png',
    },
    {
      'name': 'CULTURAL PLACE',
      'description': 'MUSIC COMPLEX | ½ Day (6 Hour): RM2,025.00 |  1 Day (24 Hour): RM2700.00',
      'category': 'hall',
      'image': 'assets/images/panggung_budaya.jpg',
    },
    {
      'name': 'SPACE RENT',
      'description': '½ Day (6 Hour): None | 1 Day (24 Hour): RM0.50/M2',
      'category': 'hall',
         'image': 'assets/images/sewa_ruang.jpg',
    },
      {
      'name': 'SPACE FOR BUILDING',
      'description': '½ Day (6 Hour): None | 1 Day (24 Hour): RM30/TABLE',
      'category': 'hall',
         'image': 'assets/images/ruang_legar.jpg',
    },
      {
      'name': 'DKPP 4',
      'description': '½ Day (6 Hour): RM135.00 | 1 Day (24 Hour): RM180.00',
      'category': 'hall',
         'image': 'assets/images/dkpp4.jpg',
    },
    {
      'name': 'DKPP 3',
      'description': '½ Day (6 Hour): RM135.00 | 1 Day (24 Hour): RM180.00',
      'category': 'hall',
         'image': 'assets/images/dkpp3.jpg',
    },
    {
      'name': 'DKPP 2',
      'description': '½ Day (6 Hour): RM135.00 | 1 Day (24 Hour): RM180.00',
      'category': 'hall',
         'image': 'assets/images/dkpp2.jpg',
    },
    {
      'name': 'DKPP 1',
      'description': '½ Day (6 Hour): RM225.00 | 1 Day (24 Hour): RM300.00',
      'category': 'hall',
         'image': 'assets/images/dkpp1.jpg',
    },
    {
      'name': 'LECTURE HALL B',
      'description': '½ Day (6 Hour): RM280.00 | 1 Day (24 Hour): RM375.00',
      'category': 'hall',
         'image': 'assets/images/dewan_kuliahB.jpg',
    },
    {
      'name': 'LECTURE HALL A',
      'description': '½ Day (6 Hour): RM280.00 | 1 Day (24 Hour): RM375.00',
      'category': 'hall',
         'image': 'assets/images/dewan_kuliahA.jpg',
    },
     {
      'name': 'LECTURE HALL',
      'description': '½ Day (6 Hour): RM115.00 | 1 Day (24 Hour): RM150.00',
      'category': 'hall',
         'image': 'assets/images/bilik_kuliah.jpg',
    },
     {
      'name': 'LECTURE HALL',
      'description': '½ Day (6 Hour): RM60.00 | 1 Day (24 Hour): RM75.00',
      'category': 'hall',
         'image': 'assets/images/bilik_kuliah1.jpg',
    },
     {
      'name': ' VIP HALL ',
      'description': '½ Day (6 Hour): RM300.00 | 1 Day (24 Hour): RM400.00',
      'category': 'hall',
         'image': 'assets/images/vip_suluh_budiman.png',
    },
     {
      'name': 'CHANCELLOR VIP HALL',
      'description': '½ Day (6 Hour): RM300.00 | 1 Day (24 Hour): RM400.00',
      'category': 'hall',
         'image': 'assets/images/vip_canselori.png',
    },
     {
      'name': 'AUDITORIUM 2',
      'description': '½ Day (6 Hour): RM750.00 | 1 Day (24 Hour): RM1,000.00',
      'category': 'hall',
         'image': 'assets/images/auditorium1.jpg',
    },
     {
         'name': 'AUDITORIUM 1',
      'description': '½ Day (6 Hour): RM750.00 | 1 Day (24 Hour): RM1,000.00',
      'category': 'hall',
         'image': 'assets/images/auditorium1.jpg',
    },
     {
      'name': 'MAIN AUDITORIUM',
      'description': '½ Day (6 Hour): RM1,950.00 | 1 Day (24 Hour): RM2,600.00',
      'category': 'hall',
         'image': 'assets/images/auditorium.jpg',
    },
     {
      'name': 'AUDITORIUM',
      'description': '½ Day (6 Hour): RM3,450.00 | 1 Day (24 Hour): RM4,600.00',
      'category': 'hall',
         'image': 'assets/images/auditorium_luar.jpg',
    },
     {
      'name': 'CULTURE HALL ',
      'description': '½ Day (6 Hour): RM225.00 | 1 Day (24 Hour): RM300.00',
      'category': 'hall',
         'image': 'assets/images/dewan_suluh_budiman.jpg',
    },
     {
      'name': 'RAHMAN TALIB HALL',
      'description': '½ Day (6 Hour): RM900.00 | 1 Day (24 Hour): RM1200.00',
      'category': 'hall',
         'image': 'assets/images/dewan_rahman.jpg',
    },
     {
      'name': 'SRI TANJONG HALL',
      'description': '½ Day (6 Hour): RM450.00 | 1 Day (24 Hour): RM600.00',
      'category': 'hall',
         'image': 'assets/images/dewan_sri.jpg',
    },
     {
      'name': 'SITC HALL',
      'description': '½ Day (6 Hour): RM2550.00 | 1 Day (24 Hour): RM3400.00',
      'category': 'hall',
         'image': 'assets/images/dewan_sitc.jpg',
    },

    //Sport
    {
      'name': 'ARTIFICIAL WALL',
      'description': 'ONE Day (8 Hour): RM 6.00 | 1 Hour (SIANG): RM 1.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/tembok_tiruan.jpg',
    },
     {
      'name': 'MEETING ROOM',
      'description': 'One Day (8 Hour): RM 75.00 | 6 Hour (SIANG): RM 55.00 | 6 Hour…',
      'category': 'sport',
         'image': 'assets/images/bilik_mesyuarat.jpg',
    },
     {
      'name': 'WEIGHT TRAINING ROOM',
      'description': 'One Day (8 Hour): - | 1 Hour (SIANG): RM 2.00 | 1 Hour (Night):…',
      'category': 'sport',
         'image': 'assets/images/latihan_bebanan.jpg',
    },
     {
      'name': 'FUTSAL',
      'description': 'One Day (8 Hour): RM 60.00 | 1 Hour (SIANG): RM 8.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/futsal.jpg',
    },
     {
      'name': 'RUGBY FIELD',
      'description': 'One Day (8 Hour): RM 220.00 | 1 Hour (SIANG): RM 30.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/padang_ragbi.jpg',
    },
     {
      'name': 'FOOTBALL FIELD',
      'description': 'One Day (8 Hour): RM 220.00 | 1 Hour (SIANG): RM 30.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/padang_bola.jpg',
    },
     {
      'name': 'VOLLEYBALL',
      'description': 'One Day (8 Hour): RM 60.00 | 1 Hour (SIANG): RM 8.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/bola_tampar.jpg',
    },
     {
      'name': 'NETBALL BALL',
      'description': 'One Day (8 Hour): RM 60.00 | 1 Hour (SIANG): RM 8.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/bola_jaring.jpg',
    },
     {
      'name': 'BASKETBALL',
      'description': 'One Day (8 Hour): RM 60.00 | 1 Hour (SIANG): RM 8.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/bola_keranjang.jpg',
    },
     {
      'name': 'TAKRAW',
      'description': 'One  Day (8 Hour): RM 60.00 | 1 Hour (SIANG): RM 8.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/takraw.jpg',
    },
     {
      'name': 'TENIS',
      'description': 'One Day (8 Hour): RM 60.00 | 1 Hour (SIANG): RM 8.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/tenis.jpg',
    },
     {
      'name': 'PING PONG',
      'description': 'One Day (8 Hour): RM 35.00 | 1 Hour (SIANG): RM 5.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/pingpong.jpg',
    },
     {
      'name': 'SQUASH',
      'description': 'One Day (8 Hour): RM 75.00 | 1 Hour (SIANG): RM 10.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/skuasy.jpg',
    },
     {
      'name': 'BADMINTON',
      'description': 'One Day (8 Hour): RM 75.00 | 1 Hour (SIANG): RM 10.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/badminton.jpg',
    },
     {
      'name': 'GYMNASIUM (INDOOR)',
      'description': 'One Day (8 Hour): RM 500.00 | 1 Hour (SIANG): RM 70.00 | 1 Hour…',
      'category': 'sport',
         'image': 'assets/images/gim.jpg',
    },
  ];

  List<Map<String, String>> get filteredCatalogs {
    if (selectedCategory == 'all') return spaceCatalogs;
    return spaceCatalogs
        .where((space) => space['category'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaces'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Category:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: selectedCategory == 'all',
                  onSelected: (_) {
                    setState(() => selectedCategory = 'all');
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Hall / Room'),
                  selected: selectedCategory == 'hall',
                  onSelected: (_) {
                    setState(() => selectedCategory = 'hall');
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Sports'),
                  selected: selectedCategory == 'sport',
                  onSelected: (_) {
                    setState(() => selectedCategory = 'sport');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: filteredCatalogs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
  final space = spaceCatalogs[index];
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SpaceDetailsPage(space: space),
        ),
      );
    },
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              space['image'] ?? '',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space['name'] ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  space['description'] ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
},
              )
              
            ),
          ],
        ),
      ),
    );
  }
}
