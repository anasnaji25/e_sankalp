import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:flutter/material.dart';

class BhakthiModelLanguageContainer extends StatelessWidget {
  String languageName;
  bool isSelected;
  BhakthiModelLanguageContainer(
      {super.key, required this.languageName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 50,
        width: size.width - 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: primaryColor)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                languageName,
                style: bakthiFont.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              if (isSelected)
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 17,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
