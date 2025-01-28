import 'package:flutter/material.dart';

class Mainpagefilteroptions extends StatefulWidget {
  const Mainpagefilteroptions({super.key});

  @override
  State<Mainpagefilteroptions> createState() => _MainpagefilteroptionsState();
}

class _MainpagefilteroptionsState extends State<Mainpagefilteroptions>
    with SingleTickerProviderStateMixin {
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