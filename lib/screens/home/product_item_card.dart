import 'package:flutter/material.dart';

class ProductItemCard extends StatefulWidget {
  final String assetPath;
  const ProductItemCard({super.key, required this.assetPath});

  @override
  State<ProductItemCard> createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final scale = _isPressed ? 0.96 : 1.0;
    final elevation = _isPressed ? 1.0 : 5.0;
    final borderColor = _isPressed
        ? const Color(0xFF5D4037)
        : Colors.transparent;
    final borderWidth = _isPressed ? 3.0 : 0.0;

    const animationDuration = Duration(milliseconds: 150);

    return AnimatedScale(
      scale: scale,
      duration: animationDuration,
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },

        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },

        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted) {
              setState(() {
                _isPressed = false;
              });
            }
          });
        },

        onLongPress: () {},

        onLongPressUp: () {
          setState(() {
            _isPressed = false;
          });
        },

        child: AnimatedContainer(
          duration: animationDuration,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: elevation,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    widget.assetPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 48,
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mẫu Bắc Bộ truyền thống 01',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '15.000.000 VNĐ',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.visibility, color: Colors.grey, size: 14),
                          SizedBox(width: 4),
                          Text(
                            '1,294',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
