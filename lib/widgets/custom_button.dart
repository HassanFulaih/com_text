import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomButton extends StatelessWidget {
  final String title;

  const CustomButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        padding:MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8, vertical: 12),),
        backgroundColor: MaterialStateProperty.all(const Color(0xFFEBEBEB)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: () {},
      label: const Icon(
        Iconsax.arrow_square_down5,
        color: Color(0xFF333333),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(
          title,
          style: const TextStyle(color: Color(0xFF333333)),
        ),
      ),
    );
  }
}
