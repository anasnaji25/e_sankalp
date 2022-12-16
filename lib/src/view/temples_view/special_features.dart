import 'package:e_sankalp/src/const/app_font.dart';
import 'package:flutter/material.dart';

class SpecialFeaturesView extends StatefulWidget {
  String title;
  SpecialFeaturesView({super.key, required this.title});

  @override
  State<SpecialFeaturesView> createState() => _SpecialFeaturesViewState();
}

class _SpecialFeaturesViewState extends State<SpecialFeaturesView> {
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
          "Special Features",
          style: primaryFont.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "${widget.title}:",
              style: primaryFont.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Built about 125 years back, this much-hallowed and regularly frequented Muruga sannidhi has emerged from a thatched shed, an unostentatious one enshrining a Murugan picture only, and established for itself a name on par with ancient places of worship. Around 7,000 couples are married here each year.",
              style: primaryFont.copyWith(color: Colors.black45, fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/temple_image (6).png",
                  height: 170,
                ),
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/images/temple_image (7).png",
                  height: 170,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "According to the sthalapurana, one Muruga devotee by name Annaswami Tambiran with his limited means built a small thatched hut and kept a Murugan painting for his personal worship primarily. During his meditation and worship, he used to experience some divine power entering his body and inspiring him to utter some mysterious things -- whatever he said in his trance was found true. His utterance went by the name of arulvak and relieved people in several ways, like curing diseases and getting jobs, solemnising marriages, etc.\n\nThe moolavar in standing posture resembles the Palani Muruga in every respect. In the inner prakara, there are many niches housing Dakshina Murti, Chandikeswar, Mahalakshmi, et al. It has a spacious hall used for conducting marriages and religious discourses. It is one of the most-frequented Murugan shrines in the city of Chennai.",
              style: primaryFont.copyWith(color: Colors.black45, fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Other deities:",
              style: primaryFont.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Arunagirinathar, Chokkanatha, Ganapathi, Kaliamman, Kasi Viswanatha, Kuthuvar, Manikkavachakar, Meenakshi Amman, Six-faced Muruga with Valli and Devanai, Vairavar, Varasiddhi Vinayaga, Virabagudevar, Virabhadra, Visalakshi",
              style: primaryFont.copyWith(color: Colors.black45, fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Festivals:",
              style: primaryFont.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Skanda Sasti is celebrated here in the month of Aippasi. Other festivals celebrated here include Panguni Uttiram. The Karttikai asterism in each month attracts large crowds.",
              style: primaryFont.copyWith(color: Colors.black45, fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
