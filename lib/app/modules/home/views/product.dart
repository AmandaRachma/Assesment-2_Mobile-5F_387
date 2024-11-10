import 'package:flutter/material.dart';
import 'package:appbaru/app/modules/home/controllers/product_controller.dart';
import 'package:appbaru/app/modules/home/views/search.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductDetailController controller =
      ProductDetailController(); // Instance controller
  
  // Menambahkan item sebagai parameter
  final Item item;

  // Constructor untuk menerima item
  ProductDetailPage({required this.item});

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
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Image and gallery section
          Container(
            height: 300,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    item.imageUrl, // Menggunakan URL gambar dari item
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // Image Thumbnails
                        for (var i = 1; i <= 6; i++)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/img/search$i.jpg', // Gambar thumbnail
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Female's Style",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  item.title, // Menggunakan judul dari item
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      item.rating.toString(), // Menggunakan rating dari item
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Product Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Read more",
                   // Menggunakan detail dari item
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),

                // Size selection
                Text(
                  "Select Size",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var size in ['S', 'M', 'L', 'XL', 'XXL'])
                      ChoiceChip(
                        label: Text(size),
                        selected: controller.selectedSize == size,
                        onSelected: (isSelected) {
                          if (isSelected) {
                            controller.setSize(size);
                          }
                        },
                      ),
                  ],
                ),
                SizedBox(height: 16),

                // Color selection
                Text(
                  "Select Color : Brown",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    for (var color in [
                      Colors.brown[200],
                      Colors.brown,
                      Colors.black
                    ])
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: GestureDetector(
                          child: CircleAvatar(
                            backgroundColor: color,
                            radius: 16,
                            child: controller.selectedColor == color
                                ? Icon(Icons.check,
                                    color: Colors.white, size: 16)
                                : null,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 16),

                // Price and Add to Cart
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "\$${item.price.toString()}", // Menggunakan harga dari item
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag),
                      label: Text("Add to Cart"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.brown,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
