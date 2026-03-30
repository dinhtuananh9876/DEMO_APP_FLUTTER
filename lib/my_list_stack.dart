import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_product.dart';

class MyListStack extends StatelessWidget {
  const MyListStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DANH SÁCH KHÁCH SẠN'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(children: [...List.generate(5, (index) => item())]),
    );
  }

  Widget item() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 205,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //ẢNH + NHÃN
          Stack(
            // dùng để cho các wideg chồng lên nhau
            children: [
              ClipRRect(
                // để bo goc ảnh
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://images.unsplash.com/photo-1769114474398-a7aef0625ef0?w=500",
                  width: 150,
                  height: 190,
                  fit: BoxFit.cover, // không bị vỡ ảnh
                ),
              ),

              /// Nhãn "Bao bữa sáng"
              Positioned(
                // nằm lên trên ảnh
                top: 20,
                left: 30,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Bao bữa sáng",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 20),

          //PHẦN THÔNG TIN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TÊN HOTEL + TIM
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "EMM Hotel Hue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.favorite_border),
                  ],
                ),

                SizedBox(height: 4),

                /// SAO + GENIUS
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Icon(Icons.star, color: Colors.orange, size: 16),

                    Icon(Icons.star, color: Colors.grey, size: 16),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Genius",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                // ĐIỂM ĐÁNH GIÁ
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "9.1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text("Tuyệt hảo"),
                    SizedBox(width: 6),
                    Text(
                      "• 677 đánh giá",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                /// ĐỊA ĐIỂM
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("Huế"),
                    SizedBox(width: 6),
                    Text(
                      "• Cách bạn 300m",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                /// LOẠI PHÒNG
                Text("1 phòng khách sạn: 1 giường đôi"),
                Text("hoặc 2 giường đơn"),

                Spacer(),

                /// GIÁ + THUẾ PHÍ
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "US\$38",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Đã bao gồm thuế và phí",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
