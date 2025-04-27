// lib/features/explore/presentation/widgets/search_bar_widget.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearch;

  const SearchBarWidget({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.surfaceColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: ColorPalette.textPrimaryColor),
        decoration: InputDecoration(
          hintText: 'Search for movies, shows, genres...',
          hintStyle: const TextStyle(color: ColorPalette.textSecondaryColor),
          prefixIcon: const Icon(
            Icons.search,
            color: ColorPalette.textSecondaryColor,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear,
              color: ColorPalette.textSecondaryColor,
            ),
            onPressed: () {
              _searchController.clear();
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onSubmitted: (value) {
          widget.onSearch(value);
        },
      ),
    );
  }
}