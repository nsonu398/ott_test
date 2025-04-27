// lib/features/downloads/presentation/widgets/storage_info_card.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';

class StorageInfoCard extends StatelessWidget {
  final double usedSpace;
  final double totalSpace;
  final double percentageUsed;

  const StorageInfoCard({
    Key? key,
    required this.usedSpace,
    required this.totalSpace,
    required this.percentageUsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorPalette.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Device Storage',
                style: TextStyle(
                  color: ColorPalette.textPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${usedSpace.toStringAsFixed(1)} GB / ${totalSpace.toStringAsFixed(1)} GB',
                style: const TextStyle(
                  color: ColorPalette.textSecondaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentageUsed,
              backgroundColor: ColorPalette.backgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(_getProgressColor(percentageUsed)),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStorageItem(
                icon: Icons.download_done,
                color: ColorPalette.primaryColor,
                label: 'Downloads',
                value: '${usedSpace.toStringAsFixed(1)} GB',
              ),
              _buildStorageItem(
                icon: Icons.storage,
                color: ColorPalette.accentColor,
                label: 'Free Space',
                value: '${(totalSpace - usedSpace).toStringAsFixed(1)} GB',
              ),
              _buildStorageItem(
                icon: Icons.delete_outline,
                color: ColorPalette.warningColor,
                label: 'Clear All',
                isButton: true,
                onTap: () {
                  // Show clear all downloads dialog
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStorageItem({
    required IconData icon,
    required Color color,
    required String label,
    String? value,
    bool isButton = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: isButton ? color : ColorPalette.textSecondaryColor,
              fontSize: 12,
              fontWeight: isButton ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          if (value != null)
            Text(
              value,
              style: const TextStyle(
                color: ColorPalette.textPrimaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Color _getProgressColor(double percentage) {
    if (percentage < 0.5) {
      return ColorPalette.successColor;
    } else if (percentage < 0.8) {
      return ColorPalette.warningColor;
    } else {
      return ColorPalette.errorColor;
    }
  }
}