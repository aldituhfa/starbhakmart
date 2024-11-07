import 'package:flutter/material.dart';
import 'package:starbhakmart/add%20produk.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  List<Map<String, dynamic>> products = [
    {
      'title': 'Burger King Medium',
      'price': 'Rp. 50.000,00',
      'imageUrl': 'https://tse1.mm.bing.net/th?id=OIP.Rdy3GcwhIqv_7I7LaxMRJQHaG6&pid=Api&P=0&h=180',
    },
    {
      'title': 'Coca Cola',
      'price': 'Rp. 4.000,00',
      'imageUrl': 'https://tse4.mm.bing.net/th?id=OIP.mwVMDWiGxzALxPJwjRbF4QHaHa&pid=Api&P=0&h=180',
    },
    {
      'title': 'Burger King Large',
      'price': 'Rp. 60.000,00',
      'imageUrl': 'https://tse1.mm.bing.net/th?id=OIP.Rdy3GcwhIqv_7I7LaxMRJQHaG6&pid=Api&P=0&h=180',
    },
    {
      'title': 'Fanta',
      'price': 'Rp. 9.000,00',
      'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.JRyy58qhOP0s-XI4IinPzwHaHa&pid=Api&P=0&h=180',
    },
    {
      'title': 'Hot Dog',
      'price': 'Rp. 15.000,00',
      'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.b7gaP88IQPpxPbQBVgLN-wHaF-&pid=Api&P=0&h=180',
    },
    {
      'title': 'Kentang',
      'price': 'Rp. 15.000,00',
      'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.yr6_hWGRGHIuHrRboEW0dQHaHj&pid=Api&P=0&h=180',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add Data', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductScreen()),
              );
            },
            child: Text('Add Data'),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductItem(
                  product['title'],
                  product['price'],
                  product['imageUrl'],
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String title, String price, String imageUrl, int index) {
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
              Text(price),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                products.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  }
}
