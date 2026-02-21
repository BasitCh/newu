import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color textColor;
  final Color secondaryColor;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.textColor,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: GoogleFonts.inter(fontSize: 13, color: secondaryColor),
        ),
      ],
    );
  }
}

class SelectorPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color orangeColor;
  final Color pillColor;
  final bool isDark;
  final VoidCallback onTap;

  const SelectorPill({
    super.key,
    required this.label,
    required this.isSelected,
    required this.orangeColor,
    required this.pillColor,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF4A2B00) : const Color(0xFFFFF2E5))
              : pillColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? orangeColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: isSelected
                ? orangeColor
                : (isDark ? Colors.white70 : const Color(0xFF8A8A8E)),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class StepperButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bgColor;
  final VoidCallback onTap;

  const StepperButton({
    super.key,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 18, color: color),
        ),
      ),
    );
  }
}

class AdjusterRow extends StatelessWidget {
  final String title;
  final int value;
  final Color pillColor;
  final Color textColor;
  final Function(int) onChanged;

  const AdjusterRow({
    super.key,
    required this.title,
    required this.value,
    required this.pillColor,
    required this.textColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = textColor == Colors.white;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: pillColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          Row(
            children: [
              StepperButton(
                icon: Icons.remove,
                color: textColor,
                bgColor: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.white,
                onTap: () {
                  if (value > 0) onChanged(value - 1);
                },
              ),
              SizedBox(
                width: 48,
                child: Text(
                  '${value}s',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              StepperButton(
                icon: Icons.add,
                color: textColor,
                bgColor: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.white,
                onTap: () => onChanged(value + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
