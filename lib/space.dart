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
      'name': 'BILIK MESYUARAT UTAMA CANSELORI',
      'description': '½ HARI (6 JAM): RM375.00 | 1 HARI (24 JAM): RM500.00',
      'category': 'hall',
       'image': 'assets/images/mesyuarat_canselori.jpg',
    },
    {
      'name': 'BILIK MESYUARAT UTAMA SULUH BUDIMAN',
      'description': '½ HARI (6 JAM): RM225.00 | 1 HARI (24 JAM): RM300.00',
      'category': 'hall',
       'image': 'assets/images/mesyuarat_suluhbudiman.png',
    },
    {
      'name': 'PANGGUNG BUDAYA, KOMPLEKS MUZIK',
      'description': '½ HARI (6 JAM): RM2,025.00 | 1 HARI (24 JAM): RM2700.00',
      'category': 'hall',
      'image': 'assets/images/panggung_budaya.jpg',
    },
    {
      'name': 'SEWA RUANG',
      'description': '½ HARI (6 JAM): None | 1 HARI (24 JAM): RM0.50/M2',
      'category': 'hall',
         'image': 'assets/images/sewa_ruang.jpg',
    },
      {
      'name': 'RUANG LEGAR BAGUNAN',
      'description': '½ HARI (6 JAM): None | 1 HARI (24 JAM): RM30/MEJA',
      'category': 'hall',
         'image': 'assets/images/ruang_legar.jpg',
    },
      {
      'name': 'DKPP 4',
      'description': '½ HARI (6 JAM): RM135.00 | 1 HARI (24 JAM): RM180.00',
      'category': 'hall',
         'image': 'assets/images/dkpp4.jpg',
    },
    {
      'name': 'DKPP 3',
      'description': '½ HARI (6 JAM): RM135.00 | 1 HARI (24 JAM): RM180.00',
      'category': 'hall',
         'image': 'assets/images/dkpp3.jpg',
    },
    {
      'name': 'DKPP 2',
      'description': '½ HARI (6 JAM): RM135.00 | 1 HARI (24 JAM): RM180.00',
      'category': 'hall',
         'image': 'assets/images/dkpp2.jpg',
    },
    {
      'name': 'DKPP 1',
      'description': '½ HARI (6 JAM): RM225.00 | 1 HARI (24 JAM): RM300.00',
      'category': 'hall',
         'image': 'assets/images/dkpp1.jpg',
    },
    {
      'name': 'DEWAN KULIAH B',
      'description': '½ HARI (6 JAM): RM280.00 | 1 HARI (24 JAM): RM375.00',
      'category': 'hall',
         'image': 'assets/images/dewan_kuliahB.jpg',
    },
    {
      'name': 'DEWAN KULIAH A',
      'description': '½ HARI (6 JAM): RM280.00 | 1 HARI (24 JAM): RM375.00',
      'category': 'hall',
         'image': 'assets/images/dewan_kuliahA.jpg',
    },
     {
      'name': 'BILIK KULIAH',
      'description': '½ HARI (6 JAM): RM115.00 | 1 HARI (24 JAM): RM150.00',
      'category': 'hall',
         'image': 'assets/images/bilik_kuliah.jpg',
    },
     {
      'name': 'BILIK KULIAH',
      'description': '½ HARI (6 JAM): RM60.00 | 1 HARI (24 JAM): RM75.00',
      'category': 'hall',
         'image': 'assets/images/bilik_kuliah1.jpg',
    },
     {
      'name': 'BILIK VIP SULUH BUDIMAN',
      'description': '½ HARI (6 JAM): RM300.00 | 1 HARI (24 JAM): RM400.00',
      'category': 'hall',
         'image': 'assets/images/vip_suluh_budiman.png',
    },
     {
      'name': 'BILIK VIP CANSELORI',
      'description': '½ HARI (6 JAM): RM300.00 | 1 HARI (24 JAM): RM400.00',
      'category': 'hall',
         'image': 'assets/images/vip_canselori.png',
    },
     {
      'name': 'AUDITORIUM 2',
      'description': '½ HARI (6 JAM): RM750.00 | 1 HARI (24 JAM): RM1,000.00',
      'category': 'hall',
         'image': 'assets/images/auditorium1.jpg',
    },
     {
         'name': 'AUDITORIUM 1',
      'description': '½ HARI (6 JAM): RM750.00 | 1 HARI (24 JAM): RM1,000.00',
      'category': 'hall',
         'image': 'assets/images/auditorium1.jpg',
    },
     {
      'name': 'AUDITORIUM UTAMA',
      'description': '½ HARI (6 JAM): RM1,950.00 | 1 HARI (24 JAM): RM2,600.00',
      'category': 'hall',
         'image': 'assets/images/auditorium.jpg',
    },
     {
      'name': 'AUDITORIUM',
      'description': '½ HARI (6 JAM): RM3,450.00 | 1 HARI (24 JAM): RM4,600.00',
      'category': 'hall',
         'image': 'assets/images/auditorium_luar.jpg',
    },
     {
      'name': 'DEWAN SULUH BUDIMAN',
      'description': '½ HARI (6 JAM): RM225.00 | 1 HARI (24 JAM): RM300.00',
      'category': 'hall',
         'image': 'assets/images/dewan_suluh_budiman.jpg',
    },
     {
      'name': 'DEWAN RAHMAN TALIB',
      'description': '½ HARI (6 JAM): RM900.00 | 1 HARI (24 JAM): RM1200.00',
      'category': 'hall',
         'image': 'assets/images/dewan_rahman.jpg',
    },
     {
      'name': 'DEWAN SRI TANJONG',
      'description': '½ HARI (6 JAM): RM450.00 | 1 HARI (24 JAM): RM600.00',
      'category': 'hall',
         'image': 'assets/images/dewan_sri.jpg',
    },
     {
      'name': 'DEWAN SITC',
      'description': '½ HARI (6 JAM): RM2550.00 | 1 HARI (24 JAM): RM3400.00',
      'category': 'hall',
         'image': 'assets/images/dewan_sitc.jpg',
    },

    //Sport
    {
      'name': 'TEMBOK TIRUAN',
      'description': 'SATU HARI (8 JAM): RM 6.00 | 1 JAM (SIANG): RM 1.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/tembok_tiruan.jpg',
    },
     {
      'name': 'BILIK MESYUARAT',
      'description': 'SATU HARI (8 JAM): RM 75.00 | 6 JAM (SIANG): RM 55.00 | 6 JAM…',
      'category': 'sport',
         'image': 'assets/images/bilik_mesyuarat.jpg',
    },
     {
      'name': 'DBILIK LATIHAN BEBANAN',
      'description': 'SATU HARI (8 JAM): - | 1 JAM (SIANG): RM 2.00 | 1 JAM (MALAM):…',
      'category': 'sport',
         'image': 'assets/images/latihan_bebanan.jpg',
    },
     {
      'name': 'FUTSAL',
      'description': 'SATU HARI (8 JAM): RM 60.00 | 1 JAM (SIANG): RM 8.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/futsal.jpg',
    },
     {
      'name': 'PADANG RAGBI',
      'description': 'SATU HARI (8 JAM): RM 220.00 | 1 JAM (SIANG): RM 30.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/padang_ragbi.jpg',
    },
     {
      'name': 'PADANG BOLASEPAK',
      'description': 'SATU HARI (8 JAM): RM 220.00 | 1 JAM (SIANG): RM 30.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/padang_bola.jpg',
    },
     {
      'name': 'BOLA TAMPAR',
      'description': 'SATU HARI (8 JAM): RM 60.00 | 1 JAM (SIANG): RM 8.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/bola_tampar.jpg',
    },
     {
      'name': 'BOLA JARING',
      'description': 'SATU HARI (8 JAM): RM 60.00 | 1 JAM (SIANG): RM 8.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/bola_jaring.jpg',
    },
     {
      'name': 'BOLA KERANJANG',
      'description': 'SATU HARI (8 JAM): RM 60.00 | 1 JAM (SIANG): RM 8.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/bola_keranjang.jpg',
    },
     {
      'name': 'TAKRAW',
      'description': 'SATU HARI (8 JAM): RM 60.00 | 1 JAM (SIANG): RM 8.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/takraw.jpg',
    },
     {
      'name': 'TENIS',
      'description': 'SATU HARI (8 JAM): RM 60.00 | 1 JAM (SIANG): RM 8.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/tenis.jpg',
    },
     {
      'name': 'PING PONG',
      'description': 'SATU HARI (8 JAM): RM 35.00 | 1 JAM (SIANG): RM 5.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/pingpong.jpg',
    },
     {
      'name': 'SKUASY',
      'description': 'SATU HARI (8 JAM): RM 75.00 | 1 JAM (SIANG): RM 10.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/skuasy.jpg',
    },
     {
      'name': 'BADMINTON',
      'description': 'SATU HARI (8 JAM): RM 75.00 | 1 JAM (SIANG): RM 10.00 | 1 JAM…',
      'category': 'sport',
         'image': 'assets/images/badminton.jpg',
    },
     {
      'name': 'GIMNASIUM (INDOOR)',
      'description': 'SATU HARI (8 JAM): RM 500.00 | 1 JAM (SIANG): RM 70.00 | 1 JAM…',
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
              'Pilih Kategori:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Semua'),
                  selected: selectedCategory == 'all',
                  onSelected: (_) {
                    setState(() => selectedCategory = 'all');
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Dewan / Bilik'),
                  selected: selectedCategory == 'hall',
                  onSelected: (_) {
                    setState(() => selectedCategory = 'hall');
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Sukan'),
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
