import 'package:flutter/material.dart';
import 'package:starbhakmart/add%20data.dart';
import 'package:starbhakmart/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> foodItems = [
    {
      'title': 'Burger King Medium',
      'price': 'Rp. 50.000,00',
      'imageUrl': 'https://tse1.mm.bing.net/th?id=OIP.Rdy3GcwhIqv_7I7LaxMRJQHaG6&pid=Api&P=0&h=180'
    },
    {
      'title': 'Burger King Large',
      'price': 'Rp. 60.000,00',
      'imageUrl': 'https://tse1.mm.bing.net/th?id=OIP.Rdy3GcwhIqv_7I7LaxMRJQHaG6&pid=Api&P=0&h=180'
    },
    {
      'title': 'Coca Cola',
      'price': 'Rp. 4.000,00',
      'imageUrl': 'https://tse4.mm.bing.net/th?id=OIP.mwVMDWiGxzALxPJwjRbF4QHaHa&pid=Api&P=0&h=180'
    },
    {
      'title': 'Pepsi',
      'price': 'Rp. 7.000,00',
      'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.xnR2WHZm647M1_5xSHdEYQHaHa&pid=Api&P=0&h=180'
    },
    {
      'title': 'Fanta',
      'price': 'Rp. 9.000,00',
      'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.JRyy58qhOP0s-XI4IinPzwHaHa&pid=Api&P=0&h=180'
    },
    {
      'title': 'Sprite',
      'price': 'Rp. 5.000,00',
      'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.Md_OBowNhewhpc-DI5D6-QAAAA&pid=Api&P=0&h=180'
    },
    {
      'title': 'Kentang',
      'price': 'Rp. 15.000,00',
      'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.yr6_hWGRGHIuHrRboEW0dQHaHj&pid=Api&P=0&h=180'
    },
    {
      'title': 'Hot Dog',
      'price': 'Rp. 15.000,00',
      'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.b7gaP88IQPpxPbQBVgLN-wHaF-&pid=Api&P=0&h=180'
    },
  ];

  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = foodItems; 
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      filteredItems = foodItems
          .where((item) =>
              item['title']!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gratis Ongkir',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'hingga Rp 80 rb',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Text(
                    '3 jt',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
                children: filteredItems.map((item) {
                  return _buildFoodItem(
                    item['title']!,
                    item['price']!,
                    item['imageUrl']!,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
        ],
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddDataScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildFoodItem(String title, String price, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(price, style: TextStyle(color: Colors.grey.shade600)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.add_circle, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
