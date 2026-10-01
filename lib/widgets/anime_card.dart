import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;

  const AnimeCard({
    super.key,
    required this.id,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar perangkat
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        return SizedBox(
          width: cardWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image section - mengambil sebagian besar ruang (flex: 8)
              Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              
              // Spasi kecil antar gambar dan teks jika diperlukan
              SizedBox(height: screenHeight * 0.005),

              // Title section - ringkas dan mudah dibaca (flex: 2)
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.015,
                    vertical: screenHeight * 0.005,
                  ),
                  child: Center(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}