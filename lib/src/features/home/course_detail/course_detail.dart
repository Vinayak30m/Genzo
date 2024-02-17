import 'package:flutter/material.dart';
import 'package:genzo/src/core/providers/cart_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

class CourseDetailScreen extends StatefulWidget {
  final dynamic courseDetailData;

  const CourseDetailScreen({super.key, this.courseDetailData});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
      widget.courseDetailData['videoUrl'],
    );
    _initializeVideoPlayerFuture =
        _videoPlayerController!.initialize().then((_) {
      // Set video to play mode
      _videoPlayerController!.play();
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseDetailData['courseTitle'],
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController!),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.courseDetailData['tutorName'],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.courseDetailData['courseDuration']} /hour',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '₹ ${widget.courseDetailData['coursePrice']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.courseDetailData['courseTitle'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.courseDetailData['courseDescription'],
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton.icon(
              onPressed: () {
                _cartProvider.addToCart(
                  widget.courseDetailData['courseId'],
                  widget.courseDetailData['courseTitle'],
                  widget.courseDetailData['tutorName'],
                  widget.courseDetailData['courseDescription'],
                  widget.courseDetailData['imageUrl'],
                  widget.courseDetailData['videoUrl'],
                  widget.courseDetailData['videoUrlList'],
                  widget.courseDetailData['courseDuration'],
                  widget.courseDetailData['coursePrice'],
                  widget.courseDetailData['createdAt'],
                );
              },
              icon: Icon(Icons.add_shopping_cart, color: Colors.white,),
              label: Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blueAccent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Buy Now button logic
              },
              icon: Icon(Icons.shopping_cart, color: Colors.white,),
              label: Text(
                'Buy Now',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blueAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
