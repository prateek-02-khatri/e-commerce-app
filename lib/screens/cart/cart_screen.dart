import 'package:e_commerce_app/screens/payment/payment_details.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/provider/cart_provider.dart';
import 'package:e_commerce_app/screens/cart/widgets/cart_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    final provider = CartProvider.of(context);

    return Scaffold(
      backgroundColor: kContentColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Cart App Bar
            const CartAppBar(),
            const SizedBox(height: 20),

            provider.cart.isEmpty ?
            const Center(
              child: Text(
                'No item to show..!!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) :
            Expanded(
              child: Consumer<CartProvider>(
                builder: (BuildContext context, CartProvider value, Widget? child) {
                  return ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      width: 100,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: kContentColor,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Image.asset(
                                          value.cart[index].image
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Title
                                        Text(
                                          value.cart[index].title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        // Category
                                        Text(
                                          value.cart[index].category,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        // Price
                                        Text(
                                          '\$${value.cart[index].price}',
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              right: 35,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        value.removeFromCart(index);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 24,
                                        color: Colors.red,
                                      )
                                  ),
              
                                  const SizedBox(height: 15,),
              
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: kContentColor,
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
              
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            value.decrementQuantity(index);
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 18,
                                          ),
                                        ),
              
                                        Text(
                                          value.cart[index].quantity.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
              
                                        IconButton(
                                          onPressed: () {
                                            value.incrementQuantity(index);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      }
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider value, Widget? child) {
          return IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentDetails()));
            },
            style: IconButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(55, 55)
            ),
            icon: const Icon(
              Icons.payment,
              size: 30,
            ),
          );
        },
      ),
    );
  }
}
