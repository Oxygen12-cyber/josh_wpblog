import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadLine extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String preTitle;
  final double progressValue;

  const HeadLine({
    super.key,
    required this.imageUrl,
    required this.title,
    this.preTitle = "Continue Reading?",
    this.progressValue = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffe7ecef),
      ),
      child: Row(
        children: [
          Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(preTitle),
                SizedBox(height: 12),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: 200,
                  height: 4,
                  child: LinearProgressIndicator(
                    value: progressValue,
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2),
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [FaIcon(FontAwesomeIcons.xmark, size: 16)],
            ),
          ),
        ],
      ),
    );
  }
}
