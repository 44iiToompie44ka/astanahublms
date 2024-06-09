import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> imageTitle;
  final List<String> imageMiniTitle;
  final List<String> pageUrls;

  ImageCarousel({required this.imageUrls, required this.imageTitle, required this.imageMiniTitle, required this.pageUrls});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int _currentPage = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
    );
    AutoSlide();
  }

  @override
  
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _PageView(),
            _PageIndicator(),
          ],
        ),
      ],
    );
  }

  Widget _PageView() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.imageUrls.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildImageCarouselItem(index);
        },
      ),
    );
  }

  Widget _buildImageCarouselItem(int index) {
    return GestureDetector(
      onTap: () => _launchUrl(widget.pageUrls[index]),
      child: AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget? child) {
      
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(1) * 200,
              width: Curves.easeInOut.transform(1) * 300,
              child: child,
            ),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.imageUrls[index],
                errorBuilder: (context, error, stackTrace) {
      return Image.asset('assets/ui/network_image_error.jpg'); // Path to your error image
        },
              ),
            ),
            Positioned(child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white, width: 1.5)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.imageMiniTitle[index], style: TextStyle(color: Colors.white, fontSize: 16),),
                        )),
                      SizedBox(height: 8,),
                      Text(widget.imageTitle[index], style: TextStyle(color: Colors.white, fontSize: 22),),
                      SizedBox(height: 24,),
      
                    ],
                  ),
                ],
              ),
        
            )
          ],
        ),
      ),
    );
  }

  Widget _PageIndicator() {
    return Positioned(
      bottom: 12,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imageUrls.map((url) {
          int index = widget.imageUrls.indexOf(url);
          return Container(
            width: 28.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _currentPage == index ? Colors.white : Colors.grey,
            ),
          );
        }).toList(),
      ),
    );
  }
Future<void> _launchUrl(String url) async {
  Uri _url = Uri.parse(url);

  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }}
  Future<void> AutoSlide() async {
    Future.delayed(const Duration(seconds: 3), () {
      _pageController.animateToPage(
        (_currentPage + 1) % widget.imageUrls.length,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      AutoSlide();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
