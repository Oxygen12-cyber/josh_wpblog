import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  final String imageUrl;
  final String authorAvatarUrl;
  final String category;
  final String title;
  final String preTitle;
  final String content;
  final String authorName;
  final String timeText;

  const NewsPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
    this.authorAvatarUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPO5CvTL79PoqndYQgx3k34A2ETEmkZGCxfg&s",
    this.authorName = "Josh",
    this.timeText = "3h ag0 . 4mins read",
    this.preTitle = "Design",
    this.category = "Design",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Chip(
                      label: Text(category),
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      title,
                      style: GoogleFonts.breeSerif(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Flexible(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(authorAvatarUrl),
                            ),
                            title: Text(
                              authorName.trim(),
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              timeText,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      content,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
