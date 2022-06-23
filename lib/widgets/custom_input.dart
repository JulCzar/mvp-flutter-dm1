import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onEditingComplete;
  const Input({Key? key, this.controller, this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: onEditingComplete,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.white),
        hintStyle: TextStyle(
          color: Colors.white30,
          fontWeight: FontWeight.w700,
        ),
        hintText: 'Busque uma palavra',
        border: InputBorder.none,
      ),
    );
  }
}
