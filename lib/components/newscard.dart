import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:josh_wpblog/pages/newspage.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String authorName;
  final String authorAvatarUrl;
  final String timeText;
  final String content;
  final String preTitle;

  const NewsCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.timeText,
    required this.content,
    this.preTitle = "",
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber[20],
      hoverColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsPage(
              imageUrl: imageUrl,
              title: title,
              content: content,
              authorAvatarUrl: authorAvatarUrl,
              authorName: authorName,
              timeText: timeText,
              // preTitle: preTitle,
              category: category,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[0],
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(category),
                    labelStyle: GoogleFonts.poppins(fontSize: 11),
                    backgroundColor: Colors.grey[200],
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  SizedBox(
                    // width: 100,
                    // height: ,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(authorAvatarUrl),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        authorName.trim(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        timeText,
                        style: GoogleFonts.poppins(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 2),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.ellipsisVertical, size: 16),
                  FaIcon(FontAwesomeIcons.bookmark),
                ],
              ),
            ),
            SizedBox(width: 3),
          ],
        ),
      ),
    );
  }
}
