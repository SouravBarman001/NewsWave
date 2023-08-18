import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newswave/src/features/collections/presentation/collection_screen.dart';
import 'package:newswave/src/features/search/presentation/search_screen.dart';
import 'package:newswave/src/features/settings/presentation/settings_screen.dart';

import '../../../utils/bottom_navigation_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('home screen'),
      ),
      body: Container(
      ),

    );
  }
}