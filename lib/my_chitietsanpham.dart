import 'package:flutter/material.dart';
import 'gio_hang.dart';

class ProductDetailPage extends StatelessWidget {
  // Map: Dữ liệu của 1 sản phẩm cụ thể (tên, giá, ảnh...)
  final Map product;

  // List: Danh sách giỏ hàng hiện tại được truyền từ màn hình trước
  final List cart;
  // Function: Hàm thêm vào giỏ hàng
  final Function addToCart;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.cart,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),

        // GIỎ HÀNG
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

              //  SỐ LƯỢNG
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

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(product['thumbnail']),
            const SizedBox(height: 20),

            Text(
              product['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(product['description']),

            const SizedBox(height: 10),

            Text(
              "\$${product['price']}",
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),

            const SizedBox(height: 30),

            //  2 NÚT
            Row(
              children: [
                // THÊM VÀO GIỎ
                // Expanded: Giúp nút co giãn đều trong Row
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      addToCart(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Đã thêm vào giỏ hàng')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text("THÊM VÀO GIỎ"),
                  ),
                ),

                const SizedBox(width: 10),

                //  MUA NGAY
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      addToCart(product);
                      // Bước 2: Chuyển thẳng sang trang Giỏ hàng để thanh toán luôn
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(cart: cart),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("MUA NGAY"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
