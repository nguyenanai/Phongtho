import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Model Viewer'),
        backgroundColor: const Color(0xFFF5F1EB),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F1EB),
      body: Center(
        child: ModelViewer(
          // ĐƯỜNG DẪN VÀ CÁC THUỘC TÍNH CƠ BẢN
          src: 'assets/models/Untitled.glb',
          alt: "Một mô hình 3D",
          ar: true,
          autoRotate: true,
          cameraControls: true,

          // ==========================================================
          // PHẦN THÊM VÀO ĐỂ ĐỔI SANG MÀU XÁM
          // ==========================================================
          id: "my-model-viewer", // 1. Đặt một ID cho model viewer

          // 2. Chạy JavaScript để đổi màu khi mô hình được tải xong
          interactionPrompt: InteractionPrompt.none, // Tắt thông báo mặc định
          relatedJs: """
                const modelViewer = document.querySelector('#my-model-viewer');
                modelViewer.addEventListener('load', () => {
                  const material = modelViewer.model.materials[0];
                  // Đặt màu thành màu xám trung tính
                  material.pbrMetallicRoughness.setBaseColorFactor([0.5, 0.5, 0.5, 1]); // RGBA -> Màu Xám
                });
              """,
          // ==========================================================
        ),
      ),
    );
  }
}
