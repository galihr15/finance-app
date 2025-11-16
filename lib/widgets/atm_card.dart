import 'package:flutter/material.dart';

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final Color backgroundColor;
  final bool isSecondCard;

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    this.backgroundColor = const Color(0xFF1A1A1A),
    this.isSecondCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bank Name
          Text(
            bankName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          
          // Chip Icon
          Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFFFFB84D), const Color(0xFFFF8C00)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.sim_card,
              color: Colors.white,
              size: 24,
            ),
          ),
          
          // Card Number and Mastercard Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              // Mastercard Logo (Overlapping circles)
              SizedBox(
                width: 50,
                height: 30,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Red circle
                    Positioned(
                      left: 5,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFEB001B),
                        ),
                      ),
                    ),
                    // Orange circle
                    Positioned(
                      right: 5,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF79E1B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}