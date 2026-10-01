import 'package:anime_verse/widgets/app_scaffold.dart';
import 'package:anime_verse/data/dummy_data.dart';
import 'package:flutter/material.dart';
import '../widgets/favorite_anime_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar perangkat
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Untuk sementara mengambil beberapa data anime sebagai contoh daftar favorit
    final favoriteList = DummyData.animeList.take(3).toList();

    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Anime",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: screenWidth * 0.06,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar Section (Opsional untuk menyaring anime favorit)
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.075),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: screenWidth * 0.02,
                    offset: Offset(0, screenHeight * 0.005),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search favorites...",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.04,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: screenWidth * 0.06,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.075),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.075),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.075),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF0b395e),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.015,
                  ),
                ),
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.01),

          // Favorite Anime List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final anime = favoriteList[index];
                return FavoriteAnimeCard(
                  title: anime.title,
                  genre: anime.genre,
                  rating: anime.rating,
                  imagePath: anime.imagePath,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}