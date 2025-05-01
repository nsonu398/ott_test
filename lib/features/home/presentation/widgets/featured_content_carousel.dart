// lib/features/home/presentation/widgets/featured_content_carousel.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/entities/content_entity.dart';
import 'featured_content.dart';
import '../../../../core/theme/color_palette.dart';

class FeaturedContentCarousel extends StatefulWidget {
  final List<ContentEntity> contentList;
  final bool isLoading;

  const FeaturedContentCarousel({
    Key? key,
    required this.contentList,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<FeaturedContentCarousel> createState() => _FeaturedContentCarouselState();
}

class _FeaturedContentCarouselState extends State<FeaturedContentCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  // Duration between slide transitions
  final Duration _slideDuration = const Duration(seconds: 5);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // Delay starting the auto-slide until after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoSlide();
    });
  }

  @override
  void didUpdateWidget(FeaturedContentCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reset auto slide timer if content list changes
    if (widget.contentList.length != oldWidget.contentList.length) {
      // Ensure we create a new controller if needed to prevent the error
      if (!_pageController.hasClients) {
        _pageController.dispose();
        _pageController = PageController(initialPage: 0);
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startAutoSlide();
      });
    }

    // Reset to first page if we went from loading to loaded
    if (oldWidget.isLoading && !widget.isLoading) {
      _currentPage = 0;
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.dispose();
        _pageController = PageController(initialPage: 0);
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startAutoSlide();
      });
    }
  }

  void _startAutoSlide() {
    // Cancel existing timer if any
    _autoSlideTimer?.cancel();

    // Only start auto-slide if we have more than one item
    if (widget.contentList.length > 1) {
      _autoSlideTimer = Timer.periodic(_slideDuration, (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        if (_currentPage < widget.contentList.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return _buildShimmerLoading();
    }

    if (widget.contentList.isEmpty) {
      return _buildEmptyState();
    }

    return Stack(
      children: [
        // PageView for sliding content
        PageView.builder(
          controller: _pageController,
          itemCount: widget.contentList.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          // Key is important for proper controller attachment when widget rebuilds
          key: ValueKey(widget.contentList.length),
          itemBuilder: (context, index) {
            return FeaturedContent(content: widget.contentList[index]);
          },
        ),

        // Page indicators
        if (widget.contentList.length > 1)
          Positioned(
            bottom: 16,
            right: 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                widget.contentList.length,
                    (index) => _buildPageIndicator(index == _currentPage),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? ColorPalette.primaryColor
            : ColorPalette.textSecondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Background gradient
        Container(
          width: screenSize.width,
          height: screenSize.width * 0.65,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorPalette.surfaceColor.withOpacity(0.8),
                ColorPalette.backgroundColor,
              ],
            ),
          ),
        ),

        // Shimmer effect for text elements
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title shimmer
              Container(
                width: screenSize.width * 0.6,
                height: 24,
                decoration: BoxDecoration(
                  color: ColorPalette.surfaceColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              const SizedBox(height: 8),

              // Categories shimmer
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 12,
                    decoration: BoxDecoration(
                      color: ColorPalette.surfaceColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 70,
                    height: 12,
                    decoration: BoxDecoration(
                      color: ColorPalette.surfaceColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // Year and duration shimmer
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 12,
                    decoration: BoxDecoration(
                      color: ColorPalette.surfaceColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 60,
                    height: 12,
                    decoration: BoxDecoration(
                      color: ColorPalette.surfaceColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Action buttons shimmer
              Row(
                children: [
                  // Play button shimmer
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorPalette.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Icon button shimmer
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorPalette.surfaceColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Icon button shimmer
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorPalette.surfaceColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Loading indicator overlay
        Positioned.fill(
          child: Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.width * 0.65,
      color: ColorPalette.backgroundColor,
      child: const Center(
        child: Text(
          'No featured content available',
          style: TextStyle(color: ColorPalette.textSecondaryColor),
        ),
      ),
    );
  }
}