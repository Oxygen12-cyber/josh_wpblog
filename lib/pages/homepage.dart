import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:josh_wpblog/components/headlinecard.dart';
import 'package:josh_wpblog/services/apiservice/api.dart';
import 'package:josh_wpblog/tabpages/foryou.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final _postTitleController = TextEditingController();
  final _postContentController = TextEditingController();
  final _contentBoxScrollController = ScrollController();
  final _postAuthorController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _postTitleController.dispose();
    _contentBoxScrollController.dispose();
    _postContentController.dispose();
    _tabController.dispose();
    _postAuthorController.dispose();

    super.dispose();
  }

  void createPost() {
    if (_formKey.currentState!.validate()) {
      createPostWithClient(
        _postTitleController.text,
        _postContentController.text,
        _postAuthorController.text,
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[200],
          duration: Durations.extralong3,
          content: Center(
            child: Text(
              'post created',
              style: GoogleFonts.firaMono(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[200],
          duration: Durations.extralong4,
          content: Center(
            child: Text(
              'post creation failed',
              style: GoogleFonts.firaMono(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            iconSize: 24,
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.barsStaggered),
          ),
        ),
        title: Text("Blog"),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 32,
            onPressed: () {},
            icon: CircleAvatar(
              // backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPO5CvTL79PoqndYQgx3k34A2ETEmkZGCxfg&s",
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "Hi, Good Day!",
              style: GoogleFonts.dmSerifText(fontSize: 32),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HeadLine(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStmQs7TNCFpMiLD2ZcWE8s3EU-nf435GwP6Q&s",
              title:
                  "Avatar: The Last Airbender -\nmobile game now available...",
            ),
          ),
          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 6),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              controller: _tabController,
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              indicatorColor: Colors.indigoAccent,
              labelColor: Colors.indigoAccent,
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.all(0),
              tabs: [
                Tab(
                  child: Text(
                    "For You",
                    //
                  ),
                ),
                Tab(child: Text("Popular")),
                Tab(child: Text("Trending")),
                Tab(child: Text("Categories")),
                Tab(child: Text("Following")),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomTabView(),
                  Center(
                    child: LottieBuilder.asset('assets/images/comingsoon.json'),
                  ),
                  Center(
                    child: LottieBuilder.asset('assets/images/comingsoon.json'),
                  ),
                  Center(
                    child: LottieBuilder.asset('assets/images/comingsoon.json'),
                  ),
                  Center(
                    child: LottieBuilder.asset('assets/images/comingsoon.json'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.white,
        tooltip: "Create Post",
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              backgroundColor: Colors.white,
              title: Text(
                "Create Post",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Form(
                autovalidateMode: AutovalidateMode.onUnfocus,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _postTitleController,
                      decoration: InputDecoration(
                        labelText: 'title',
                        hintText: 'Title',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8),
                          child: FaIcon(FontAwesomeIcons.heading),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter title of your post';
                        }
                        if (value.length < 12) {
                          return 'title must be at least 12 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        controller: _postAuthorController,
                        decoration: InputDecoration(
                          labelText: 'author',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter you name';
                          }
                          if (value.length > 12 || value.length < 3) {
                            return 'name should be < 12 and > 3 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Flexible(
                      child: TextFormField(
                        controller: _postContentController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        scrollController: _contentBoxScrollController,
                        decoration: InputDecoration(
                          labelText: 'Content here',
                          hintText: 'Content here',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please type your post content';
                          }
                          if (value.length < 80) {
                            return 'content must have at least 80 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black87,
                    backgroundColor: Colors.grey[200],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    _postContentController.clear();
                    _postTitleController.clear();
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.monda(fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.amber[200],
                  ),
                  onPressed: () {
                    createPost();
                    _postContentController.clear();
                    _postTitleController.clear();
                  },
                  child: Text(
                    "Create",
                    style: GoogleFonts.monda(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          );
        },
        child: FaIcon(FontAwesomeIcons.marker, size: 18),
      ),
    );
  }
}
