import 'package:flutter/material.dart';

import 'main_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerticalSlideScreen(),
    );
  }
}

class SlideItem {
  final String imageUrl;
  final String title;
  final String description;

  SlideItem({required this.imageUrl, required this.title, required this.description});
}

class VerticalSlideScreen extends StatefulWidget {
  @override
  _VerticalSlideScreenState createState() => _VerticalSlideScreenState();
}

class _VerticalSlideScreenState extends State<VerticalSlideScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Theo dõi trang hiện tại
  List<SlideItem> slideItems = [
    SlideItem(
      imageUrl: 'https://www.realmadrid.com/cs/Satellite?blobcol=urldata&blobheader=image%2Fpng&blobkey=id&blobtable=MungoBlobs&blobwhere=1203436458277&ssbinary=true',
      title: 'Jude Bellingham',
      description: 'The young midfielder of Real Madrid, stands out with his speed and intelligent ball play. He ís a unique combination of strength and technique, playing a crucial role in breaking down opponent attacks and initiating counter-attacks for the team.',
    ),
    SlideItem(
      imageUrl: 'https://www.realmadrid.com/cs/Satellite?blobcol=urldata&blobheader=image%2Fpng&blobkey=id&blobtable=MungoBlobs&blobwhere=1203436407348&ssbinary=true',
      title: 'Toni Kroos',
      description: 'The accomplished midfielder of Real Madrid, is a master at controlling the game. He is renowned for his passing and ability to dictate the pace, serving as a stable pillar that helps the team maintain ball possession.',
    ),
    SlideItem(
      imageUrl: 'https://www.realmadrid.com/cs/Satellite?blobcol=urldata&blobheader=image%2Fpng&blobkey=id&blobtable=MungoBlobs&blobwhere=1203436408212&ssbinary=true',
      title: 'Vinícius Júnior',
      description: 'The Brazilian player, is a positive source of energy for Real Madrid forward line. With his speed and dribbling skills, he often keeps the opposing defenders on their toes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: slideItems.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          slideItems[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.width * 0.2,
                          left: 20,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 320), // Giới hạn chiều ngang cho văn bản
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF141425).withOpacity(0.5), // Màu nền với độ mờ
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  slideItems[index].title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amberAccent,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  slideItems[index].description,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                ElevatedButton(
                                  onPressed: () {
                                    //routes
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MainPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF141425), // Màu nền của nút
                                    onPrimary: Colors.amberAccent, // Màu chữ trên nút
                                    padding: const EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text('Details >>'),
                                ),
                              ],
                            ),
                          )
                        ),
                      ],
                    );
                  },
                  scrollDirection: Axis.vertical,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                Positioned(
                  top: 150,
                  right: 20,
                  child: Column(
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < slideItems.length; i++) {
      indicators.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
