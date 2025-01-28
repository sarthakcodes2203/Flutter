import 'package:flutter/material.dart';

class Bars extends StatefulWidget {
  String routeName = "/bars";
  Bars({super.key});

  @override
  State<Bars> createState() => _BarsState();
}

class _BarsState extends State<Bars> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
