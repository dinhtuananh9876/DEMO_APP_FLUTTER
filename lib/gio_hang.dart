import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var item in cart) {
      total += item['price'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("GIỎ HÀNG"),
        backgroundColor: Colors.green,
      ),
      body: cart.isEmpty
          ? const Center(child: Text("Giỏ hàng trống"))
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: List.generate(cart.length, (index) {
                      final item = cart[index];

                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 5,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // 🖼 ẢNH
                            Image.network(
                              item['thumbnail'],
                              width: 80,
                              height: 80,
                            ),

                            const SizedBox(width: 10),

                            // 📄 THÔNG TIN
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Giá: \$${item['price']}"),
                                  const Text("Số lượng: 1"), // đơn giản
                                ],
                              ),
                            ),

                            // 🛒 NÚT MUA
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Đã mua sản phẩm"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: const Text("Mua"),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),

                // 💰 TỔNG TIỀN
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Tổng tiền: \$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // 🔥 NÚT MUA TẤT CẢ
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("ĐÃ MUA TẤT CẢ")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text("MUA TẤT CẢ"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
