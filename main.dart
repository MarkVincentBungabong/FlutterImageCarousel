import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  final List<String> imgList = [
    'https://tse4.mm.bing.net/th/id/OIP.-YRSLMznMNoB2G2LGt0B9wHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse1.mm.bing.net/th/id/OIP.PjEH_16NurGIY5bUEOMZ0gHaEM?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse2.mm.bing.net/th/id/OIP.5XbEWWOUsH92aooxHGAfHAHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse3.mm.bing.net/th/id/OIP.1d6nXDju1e0Xkf7UuiiWqwHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'https://tse3.mm.bing.net/th/id/OIP.StsxouBKsDeYtNU70FysRAHaEM?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
  ];
  final List<String> captionList = [
    'Mission: GRC is creating a culture for successful, socially responsible, morally upright skilled workers and highly competent professionals through value base quality education',
    'Vision: A Global Community of excellent individuals with values',
    'College of Computer Studies',
    'Mission: develops a society for IT professionals through values',
    'Vision: envisions producing quality IT Professionals with values',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My App")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.5, 16.5, 16.5, 16.5),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CarouselSlider(
                  options: CarouselOptions(
                    height:  250.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: imgList.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final String imageUrl = entry.value;
                    final String caption = captionList[index];

                    return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              key: ValueKey('carousel_item_$index'),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder: (context, error,
                                          stackTrace) => const Icon(Icons.error),
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(caption,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                          );
                        }
                    );
                  }).toList()
              Image.asset('grclogo.png',
              width: 350,
              height: 350,),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Touching Hearts, Renewing Minds, Transforming Lives",
                style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
