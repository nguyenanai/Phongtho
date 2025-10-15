import 'package:flutter/material.dart';

enum SortOption { popular, latest, price, material, other }
enum PriceSortDirection { asc, desc }

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  SortOption _selectedSortOption = SortOption.popular;
  PriceSortDirection _priceSortDirection = PriceSortDirection.desc;

  void _onSortOptionSelected(SortOption option) {
    setState(() {
      if (option == SortOption.price) {
        if (_selectedSortOption == SortOption.price) {
          _priceSortDirection = _priceSortDirection == PriceSortDirection.desc
              ? PriceSortDirection.asc
              : PriceSortDirection.desc;
        } else {
          _priceSortDirection = PriceSortDirection.desc;
        }
      }
      _selectedSortOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D4037),
        elevation: 2,
        shadowColor: Colors.black54,
        automaticallyImplyLeading: false,
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
                    icon: const Icon(
                      Icons.menu,
                      color: Color(0xFF5D4037),
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Thư viện mẫu',
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
                    child: Image.asset(
                      'assets/logo.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildFilterBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            _buildSortChip(
              label: 'PHỔ BIẾN NHẤT',
              option: SortOption.popular,
            ),
            const SizedBox(width: 8),
            _buildSortChip(
              label: 'MỚI NHẤT',
              option: SortOption.latest,
            ),
            const SizedBox(width: 8),
            _buildPriceSortChip(),
            const SizedBox(width: 8),
            _buildSortChip(
              label: 'CHẤT LIỆU',
              option: SortOption.material,
            ),
            const SizedBox(width: 8),
            _buildSortChip(
              label: 'KHÁC',
              option: SortOption.other,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortChip({required String label, required SortOption option}) {
    final isSelected = _selectedSortOption == option;
    return ActionChip(
      label: Text(label),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : const Color(0xFF5D4037),
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: isSelected ? const Color(0xFF5D4037) : const Color(0xFFFFE0B2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: isSelected ? Colors.transparent : const Color(0xFF5D4037),
          width: 1,
        ),
      ),
      onPressed: () => _onSortOptionSelected(option),
    );
  }

  Widget _buildPriceSortChip() {
    final isSelected = _selectedSortOption == SortOption.price;
    return ActionChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('GIÁ'),
          const SizedBox(width: 4),
          if (isSelected)
            Icon(
              _priceSortDirection == PriceSortDirection.desc
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              size: 16,
              color: Colors.white,
            ),
        ],
      ),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : const Color(0xFF5D4037),
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: isSelected ? const Color(0xFF5D4037) : const Color(0xFFFFE0B2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: isSelected ? Colors.transparent : const Color(0xFF5D4037),
          width: 1,
        ),
      ),
      onPressed: () => _onSortOptionSelected(SortOption.price),
    );
  }
}
