import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/gio_hang.dart' show CartPage;
import 'my_chitietsanpham.dart';

class ProductApiPage extends StatefulWidget {
  const ProductApiPage({super.key});

  @override
  State<ProductApiPage> createState() => _ProductApiPageState();
}

class _ProductApiPageState extends State<ProductApiPage> {
  List products = [];
  List cart = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  // API
  Future<void> fetchProducts() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        setState(() {
          products = response.data['products'];
          isLoading = false;
        });
      }
    } catch (e) {
      print("Lỗi API");
    }
  }

  //  ADD TO CART
  void addToCart(item) {
    setState(() {
      cart.add(item);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đã thêm vào giỏ hàng')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DANH SÁCH SẢN PHẨM'),
        backgroundColor: Colors.amber,

        //  GIỎ HÀNG
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cart: cart),
                    ),
                  );
                },
              ),

              if (cart.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: List.generate(
                products.length,
                (index) =>
                    item(products[index], context, addToCart, cart, index),
              ),
            ),
    );
  }
}

// ================= ITEM =================
Widget item(product, context, Function addToCart, List cart, int index) {
  List<Color> colors = [
    const Color.fromARGB(255, 232, 195, 140),
    const Color.fromARGB(255, 106, 174, 230),
    const Color.fromARGB(255, 220, 121, 114),
    const Color.fromARGB(255, 132, 235, 225),
    const Color.fromARGB(255, 151, 225, 154),
  ];

  // chọn màu theo index
  Color bgColor = colors[index % colors.length];
  return Container(
    height: 130,
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(product['thumbnail'], width: 100, height: 100),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${product['title']}'),
            const SizedBox(height: 20),
            Text('Price: \$${product['price']}'),
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //  ADD
            ElevatedButton(
              onPressed: () {
                addToCart(product);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("THÊM VÀO GIỎ"),
            ),

            const SizedBox(height: 10),

            //  DETAIL
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: product,
                      cart: cart,
                      addToCart: addToCart,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text("   MUA HÀNG   "),
            ),
          ],
        ),
      ],
    ),
  );
}
