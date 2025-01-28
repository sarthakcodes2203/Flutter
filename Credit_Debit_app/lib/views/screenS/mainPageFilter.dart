import 'package:flutter/material.dart';

class Mainpagefilter extends StatefulWidget {
  const Mainpagefilter({super.key});

  @override
  State<Mainpagefilter> createState() => _MainpagefilterState();
}

class _MainpagefilterState extends State<Mainpagefilter>
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