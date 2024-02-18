import 'package:flutter/material.dart';
import 'package:genzo/src/core/providers/cart_provider.dart';
import 'package:genzo/src/features/home/course_detail/course_detail.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
     ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Scaffold(
      appBar: AppBar(title: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _cartProvider.clearCart();
            },
          ),],
        backgroundColor: Colors.white,),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _cartProvider.getCartItems.length,
        itemBuilder: ((context, index) {
          final cartData = _cartProvider.getCartItems.values.toList()[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    courseDetailData: cartData,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              borderOnForeground: true,
              child: Container(
                height: screenDimensions.screenHeight * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.secondaryelevatedButtonColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenDimensions.screenWidth * 0.4,
                      height: screenDimensions.screenHeight * 0.15,
                      child: Image.network(
                        cartData.imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartData.courseTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: screenDimensions.screenWidth * 0.4,
                          child: Text(
                            cartData.courseDescription,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          '₹ ${cartData.coursePrice}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent,
                          ),),

                      ],
                    ),
                    IconButton(onPressed: (){
                      _cartProvider.removeItem(cartData.courseId);
                    }, icon: Icon(Icons.delete))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.blue,
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ₹ ${_cartProvider.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Place order
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[800],
              ),
              child: Text(
                'Buy Now ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
