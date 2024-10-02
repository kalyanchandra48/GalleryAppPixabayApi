import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/models/image_data.dart';
import 'package:gallery_app/pages/fullscreen_mode.dart';
import 'package:gallery_app/services/home_page_service.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 50,
//           title: const Text('Gallery App'),
//         ),
//         body: AlignedGridView.count(
//           crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
//           mainAxisSpacing: 4,
//           crossAxisSpacing: 4,
//           itemBuilder: (context, index) {
//             return Container(
//               color: Colors.blue,
//               child: Center(
//                 child: Text('$index'),
//               ),
//             );
//           },
//         ));
//   }
// }

class ImageGrid extends StatelessWidget {
  final List<PixaBayImage> images;

  const ImageGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          //fetchProviders(initialLimit, initialOffset += 40);
        }
        return true;
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width ~/ 150)
              .toInt(), // Adjust the number of columns as needed
          // Adjust the aspect ratio for image sizing
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(image.previewUrl ?? '', fit: BoxFit.cover),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.favorite),
                  Text(image.likes.toString()),
                  const SizedBox(width: 10),
                  const Icon(Icons.visibility),
                  Text(image.views.toString()),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PixaBayImage> images = [];
  int maxtasks = 40;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    try {
      final images = await PixabayApiService().fetchImages('kids', maxtasks);
      setState(() {
        this.images.addAll(images);
        this.images = this.images.toSet().toList();
      });
    } catch (e) {
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: Center(
          child: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            setState(() {
              maxtasks += 40;
              _fetchImages();
            });
          }
          return true;
        },
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 250)
                .toInt(), // Adjust the number of columns as needed
            // Adjust the aspect ratio for image sizing
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreenMode(
                                    image: image.largeImageUrl ?? '',
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(kIsWeb
                              ? image.largeImageUrl ?? ''
                              : image.previewUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                      Text(
                        image.likes.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.visibility,
                        size: 18,
                      ),
                      Text(image.views.toString(),
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
