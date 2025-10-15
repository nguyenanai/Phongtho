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
        backgroundColor: const Color(0xFF5D4037),
        elevation: 2,
        shadowColor: Colors.black54,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffe0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 4.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Color(0xFF5D4037), size: 30),
                    onPressed: () {},
                  ),
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
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFF5F1EB),
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm mẫu thiết kế...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFF5D4037)),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: imageAssets.length,
                      itemBuilder: (context, index) {
                        return ProductItemCard(assetPath: imageAssets[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
