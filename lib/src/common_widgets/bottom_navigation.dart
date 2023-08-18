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
      bottomNavigationBar: DotNavigationBar(
        currentIndex: currentScreenIndex,
        onTap:(int value){
          ref.read(screenIndexProvider.notifier).state = value;
      },
        // dotIndicatorColor: Colors.black,
        items: [

          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.bookmark_outline_rounded),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
            selectedColor: Colors.orange,
          ),

          /// Profile
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
