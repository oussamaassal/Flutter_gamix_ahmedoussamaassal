import 'package:flutter/material.dart';
import '/../../entities/game.dart';
import 'home/CartItem.dart'; // Import the new CartItem widget

class Panier extends StatefulWidget {
  const Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  // Static list of games for demonstration
  final List<Game> _cartItems = [];
  final String _description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, in pretium orci vestibulum eget.";

  @override
  void initState() {
    super.initState();
    _cartItems.add(
        Game("assets/images/dmc5.jpg", "Devil May Cry", _description, 200, 3000));
    _cartItems.add(Game(
        "assets/images/re8.jpg", "Resident Evil VIII", _description, 200, 3000));
    _cartItems.add(Game("assets/images/nfs.jpg", "Need For Speed Heat",
        _description, 100, 1500));
    _cartItems
        .add(Game("assets/images/rdr2.jpg", "RDR 2", _description, 150, 2500));
    _cartItems
        .add(Game("assets/images/fifa.jpg", "FIFA 22", _description, 100, 5000));
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  // Helper method to calculate the total price
  double _calculateTotal() {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: Column(
        children: [
          // Section for the Total Price
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            alignment: Alignment.centerRight,
            child: Text(
              "Total: ${_calculateTotal().toStringAsFixed(2)} TND",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          // Expanded ListView to fill the remaining space
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final game = _cartItems[index];
                // Use the new CartItem widget
                return CartItem(
                  game,
                  onRemove: () {
                    _removeItem(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
