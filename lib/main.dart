import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThirdDesign(),
    ),
  );
}

class CheckoutItem {
  String articleName;
  String imageUrl;
  int quantity;
  int price;

  CheckoutItem(
      {required this.articleName,
      required this.imageUrl,
      required this.quantity,
      required this.price});
}

class ThirdDesign extends StatefulWidget {
  @override
  _ThirdDesignState createState() => _ThirdDesignState();
}

class _ThirdDesignState extends State<ThirdDesign> {
  List<CheckoutItem> items = [];

  @override
  initState() {
    items = [
      CheckoutItem(
          articleName: 'Boggly Chair',
          imageUrl: 'assets/cropbg.png',
          quantity: 1,
          price: 150),
      CheckoutItem(
          articleName: 'Modern Sofa',
          imageUrl: 'assets/sofa.jpeg',
          quantity: 1,
          price: 180),
      CheckoutItem(
          articleName: 'Armchair',
          imageUrl: 'assets/armchair.jpeg',
          quantity: 1,
          price: 160),
    ];
  }

  String getPrices() {
    int price = 0;
    items.forEach((el) {
      price = price + (el.quantity * el.price);
    });
    return '$price';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 40),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.west,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 110, top: 40),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 20, top: 40),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_cart,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, i) {
                CheckoutItem item = items[i];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 9),
                  height: 135,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 400,
                        width: 100,
                        padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
                        child: Image.asset(item.imageUrl),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.articleName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "\$" +
                                  (item.price * item.quantity).toString() +
                                  ".00",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.quantity = item.quantity > 0
                                          ? item.quantity - 1
                                          : 0;
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  item.quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.quantity = item.quantity + 1;
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      color: Colors.black,
                                    ),
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
                SizedBox(
                  height: 5,
                );
              }),
          Container(
            height: 301,
            width: 429,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 4,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xffEBEBEB),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 194,
                    ),
                    Text(
                      '\$${getPrices()}.00',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        'Delivery Charge',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      getPrices() == '0' ? '\$00.00' : '\$80.00',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 14),
                  child: Container(
                    height: 4,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xffEBEBEB),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 225,
                    ),
                    Text(
                      '\$${int.parse(getPrices()) + int.parse(getPrices() == '0' ? '00' : '80')}.00',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 70,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.black,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ), //Container
              ],
            ),
          ),
          //Column ends here
        ],
      ),
    );
  }
}
