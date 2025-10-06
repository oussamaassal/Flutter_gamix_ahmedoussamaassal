import 'package:flutter/material.dart';
import 'package:gstore_esprit/entities/game.dart';

class ProductDetails extends StatefulWidget {
  final Game game;
  final VoidCallback onPurchase;

  const ProductDetails({required this.game,required this.onPurchase, super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  late int displayQuantity;

  @override
  void initState() {
    super.initState();
    displayQuantity = widget.game.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.title),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Image.asset(widget.game.image, width: 460, height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget.game.description),
          ),
          Text("${widget.game.price} TND", textScaleFactor: 3),
          Text("Exemplaires disponibles : $displayQuantity"),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Acheter", textScaleFactor: 2)
                ],
              ),
              onPressed: () {
                setState(() {
                  widget.game.quantity--;
                  displayQuantity = widget.game.quantity;
                  widget.onPurchase();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
