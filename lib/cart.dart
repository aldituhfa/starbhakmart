import 'package:flutter/material.dart';
import 'package:starbhakmart/main.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Burger King Medium',
      'price': 5.0000, // Store price as integer
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.Rdy3GcwhIqv_7I7LaxMRJQHaG6&pid=Api&P=0&h=180',
      'quantity': 1,
    },
    {
      'title': 'Coca Cola',
      'price': 4.000,
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.mwVMDWiGxzALxPJwjRbF4QHaHa&pid=Api&P=0&h=180',
      'quantity': 1,
    },
    {
      'title': 'Burger King Large',
      'price': 60.000,
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.Rdy3GcwhIqv_7I7LaxMRJQHaG6&pid=Api&P=0&h=180',
      'quantity': 1,
    },
    {
      'title': 'Fanta',
      'price': 9.000,
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP.JRyy58qhOP0s-XI4IinPzwHaHa&pid=Api&P=0&h=180',
      'quantity': 1,
    },
    {
      'title': 'Hot Dog',
      'price': 15.000,
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP.b7gaP88IQPpxPbQBVgLN-wHaF-&pid=Api&P=0&h=180',
      'quantity': 1,
    },
  ];

  int totalBelanja = 0;
  int ppn = 0;
  int totalPembayaran = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
  totalBelanja = cartItems.fold(
    0,
    (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int),
  );
  ppn = (totalBelanja * 0.11).toInt(); // PPN 11%
  totalPembayaran = totalBelanja + ppn;
}

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
      _calculateTotal();
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
        _calculateTotal();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cart', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return _buildCartItem(
                  item['title'],
                  item['price'],
                  item['imageUrl'],
                  item['quantity'],
                  index,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Ringkasan Belanja'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('PPN 11%'),
                    Text('Rp ${ppn.toStringAsFixed(0)}.000'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Belanja'),
                    Text('Rp ${totalBelanja.toStringAsFixed(0)}.000'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp ${totalPembayaran.toStringAsFixed(0)}.000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(
      String title, int price, String imageUrl, int quantity, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.network(imageUrl, width: 60, height: 60),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Rp ${price.toStringAsFixed(0)},00'),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () => _decreaseQuantity(index),
                  ),
                  Text('$quantity'),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () => _increaseQuantity(index),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                cartItems.removeAt(index);
                _calculateTotal(); // Recalculate after removing item
              });
            },
          ),
        ],
      ),
    );
  }
}
