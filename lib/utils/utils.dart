import 'package:flutter/material.dart';

class Utils {
  static showSnackBar({required BuildContext context, required String message, VoidCallback? onPressed}) {
     return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         duration: const Duration(seconds: 1),

         content: Text(
           message,
           style: const TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold
           ),
         ),

         action:
         onPressed != null ?
         SnackBarAction(
           onPressed: onPressed,
           label: 'Undo',
           textColor: Colors.white,
         ) : null,
       )
     );
  }
}