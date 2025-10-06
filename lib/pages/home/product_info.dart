import 'package:flutter/material.dart';
import 'package:gstore_esprit/entities/game.dart';
import 'package:gstore_esprit/pages/product_details.dart';

class ProductInfo extends StatelessWidget {
  final Game game;
  final VoidCallback onPurchase; 
  const ProductInfo({required this.game, required this.onPurchase, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              game: game,
              onPurchase: onPurchase,
            ),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                game.image,
                width: 200,
                height: 110,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(game.title),
                Text(
                  "${game.price} TND",
                  textScaleFactor: 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
