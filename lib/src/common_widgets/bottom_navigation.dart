import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/collections/presentation/collection_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/search/presentation/search_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../utils/bottom_navigation_provider.dart';



class BottomNavigation extends ConsumerWidget {
   BottomNavigation({super.key});


  List<dynamic> screens = [
    const HomeScreen(),
    const CollectionScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentScreenIndex = ref.watch(screenIndexProvider);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 3),
          ),
        ],

        currentIndex: currentScreenIndex,
        onTap: (int value) {
          ref.read(screenIndexProvider.notifier).state = value;
        },
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: Colors.purple,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.bookmark_outline_rounded),
            selectedColor: Colors.pink,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
            selectedColor: Colors.orange,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.settings),
            selectedColor: Colors.teal,
          ),
        ],
      ),
        body: screens[currentScreenIndex],
    );
  }
}
