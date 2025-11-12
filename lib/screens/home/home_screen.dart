import 'package:flutter/material.dart';
import 'product_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> imageAssets = const [
    'assets/anhphongtho1.png',
    'assets/anhphongtho2.png',
    'assets/anhphongtho3.png',
    'assets/anhphongtho4.png',
    'assets/anhphongtho5.png',
    'assets/anhphongtho6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFEF0),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF5D4037),
                  size: 30,
                ),
                onPressed: () {},
              ),
              const Expanded(
                child: Text(
                  'Phòng thờ Việt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF5D4037),
                    fontFamily: 'Serif',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  child: Image.asset('assets/logo.png', width: 40, height: 40),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 80,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm mẫu thiết kế...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF5D4037),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 3,
                shadowColor: Colors.black38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/anhphongtho1.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Text(
                'Mẫu Phòng Thờ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E342E),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductItemCard(assetPath: imageAssets[index]);
              }, childCount: imageAssets.length),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
