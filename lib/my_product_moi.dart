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
  List products = []; // Danh sách chứa các sản phẩm lấy từ API về
  List cart = []; // Danh sách chứa các sản phẩm người dùng chọn mua (Giỏ hàng)
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Vừa mở máy lên là gọi API lấy hàng về
  }

  // Hàm gọi API lấy danh sách sản phẩm
  Future<void> fetchProducts() async {
    try {
      final dio = Dio();
      // Gửi yêu cầu GET để lấy danh sách sản phẩm từ DummyJSON
      final response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        setState(() {
          // Lấy mảng dữ liệu nằm trong key 'products'
          products = response.data['products'];
          isLoading = false;
        });
      }
    } catch (e) {
      print("Lỗi API"); // In ra lỗi nếu không kết nối được
    }
  }

  // Hàm thêm sản phẩm vào giỏ hàng
  // ignore: strict_top_level_inference
  void addToCart(item) {
    setState(() {
      cart.add(item); // Thêm món đồ được chọn vào mảng 'cart'
    });

    // Hiện thông báo nhỏ xác nhận
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

        // Khu vực các nút chức năng trên thanh AppBar
        actions: [
          Stack(
            // Dùng Stack để đè con số số lượng lên biểu tượng giỏ hàng
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Nhấn vào giỏ hàng thì chuyển sang màn hình CartPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cart: cart),
                    ),
                  );
                },
              ),
              // Nếu có hàng trong giỏ thì mới hiện vòng tròn số lượng màu đỏ
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
                      cart.length.toString(), // Hiển thị số lượng món đồ
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
                products
                    .length, // Tạo ra số lượng dòng tương ứng với số sản phẩm
                (index) => item(
                  products[index],
                  context,
                  addToCart,
                  cart,
                  index,
                ), // Gọi hàm vẽ từng dòng
              ),
            ),
    );
  }
}

// Hàm Widget 'item' để vẽ từng dòng sản phẩm
// ignore: strict_top_level_inference
Widget item(product, context, Function addToCart, List cart, int index) {
  List<Color> colors = [
    const Color.fromARGB(255, 232, 195, 140),
    const Color.fromARGB(255, 122, 185, 237),
    const Color.fromARGB(255, 238, 149, 143),
    const Color.fromARGB(255, 132, 235, 225),
    const Color.fromARGB(255, 151, 225, 154),
  ];
  // Lấy màu theo index bằng phép chia lấy dư (%)
  Color bgColor = colors[index % colors.length];
  return Container(
    height: 150,
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        // 1. Hình ảnh sản phẩm (lấy từ link 'thumbnail' của API)
        Image.network(
          product['thumbnail'],
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10),

        // 2. Thông tin sản phẩm (Dùng Expanded để chiếm phần không gian ở giữa)
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product['title'], // Tên sản phẩm
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2, // Quá 2 dòng thì ẩn bớt bằng dấu "..."
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                'Price: \$${product['price']}', // Giá tiền

                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),

        // 3. Cột chứa các nút bấm
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    addToCart(product), // Gọi hàm thêm vào giỏ hàng
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(100, 35), // Giới hạn kích thước nút
                ),
                child: const Text("GIỎ", style: TextStyle(fontSize: 11)),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Chuyển hướng sang trang chi tiết sản phẩm
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: product, // Chuyền thông tin sản phẩm cụ thể
                        cart: cart, // Chuyền giỏ hàng hiện tại
                        addToCart:
                            addToCart, // Chuyền cả hàm thêm vào giỏ để dùng ở trang chi tiết
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(100, 35),
                ),
                child: const Text("MUA HÀNG", style: TextStyle(fontSize: 11)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
