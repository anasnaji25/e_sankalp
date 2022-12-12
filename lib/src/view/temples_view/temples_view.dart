import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:flutter/material.dart';

class TemplesView extends StatefulWidget {
  const TemplesView({super.key});

  @override
  State<TemplesView> createState() => _TemplesViewState();
}

class _TemplesViewState extends State<TemplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Temples",
          style: primaryFont.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications,
              color: secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
