import 'package:flutter/material.dart';
import '/../../entities/game.dart';

class CartItem extends StatelessWidget {
  final Game _game;
  final VoidCallback? onRemove;

  const CartItem(this._game, {this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // 2. Added vertical padding/margin
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // 4. Made trash icon bigger and black
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.black, size: 30),
              onPressed: onRemove,
              tooltip: "Supprimer du panier",
            ),

            // Use Expanded to give the image a flexible space
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                // 3. Fixed image ratio using ClipRRect and AspectRatio
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      _game.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // 1. Made price text bigger
            Text(
              "${_game.price} TND",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, // Increased font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
