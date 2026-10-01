import 'package:flutter/material.dart';
import '../screens/detail_screen.dart'; // Sesuaikan path import jika foldernya berbeda

class AnimeCard extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;
  final String genre;          // <-- Tambahan parameter data detail
  final String rating;         // <-- Tambahan parameter data detail
  final String totalEpisodes;  // <-- Tambahan parameter data detail
  final String description;    // <-- Tambahan parameter data detail

  const AnimeCard({
    super.key,
    required this.id,
    required this.title,
    required this.imagePath,
    this.genre = 'Action, Adventure',     // Nilai default jika kosong
    this.rating = '8.0',                  // Nilai default jika kosong
    this.totalEpisodes = '12',            // Nilai default jika kosong
    this.description = 'No description',  // Nilai default jika kosong
  });

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar perangkat
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        // Bungkus dengan InkWell agar kartu bisa diklik
        return InkWell(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          onTap: () {
            // Navigasi ke DetailScreen saat kartu diklik
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  id: id,
                  title: title,
                  imagePath: imagePath,
                  genre: genre,
                  rating: rating,
                  totalEpisodes: totalEpisodes,
                  description: description,
                ),
              ),
            );
          },
          child: SizedBox(
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
                
                // Spasi kecil antar gambar dan teks
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
          ),
        );
      },
    );
  }
}