import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(),
            PopularDestinationsSection(),
            ToursSection(),
            GallerySection(),
          ],
        ),
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter Destination',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'No. of People',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Check-In Date',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Check-Out Date',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Go Now'),
          ),
        ],
      ),
    );
  }
}

class PopularDestinationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Destinations',
            style: TextStyle(
              fontSize: 18.0, // Daha küçük metin boyutu
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DestinationCard(
                  image: 'assets/popular-1.jpg',
                  title: 'Mykonos',
                  description: 'Sea, sun and the beach...',
                ),
                SizedBox(width: 8.0),
                DestinationCard(
                  image: 'assets/popular-2.jpg',
                  title: 'Paris',
                  description: 'Romantic times? Into history...',
                ),
                SizedBox(width: 8.0),
                DestinationCard(
                  image: 'assets/popular-3.jpg',
                  title: 'Istanbul',
                  description: 'One of the most magnificent...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const DestinationCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, fit: BoxFit.cover, height: 100.0, width: 150.0),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.0, // Daha küçük metin boyutu
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 12.0), // Daha küçük metin boyutu
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToursSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Checkout Our Tours',
            style: TextStyle(
              fontSize: 18.0, // Daha küçük metin boyutu
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TourCard(
            image: 'assets/package-1.jpg',
            title: 'Unforgettable Beach Holiday in the Balkans',
            price: 750,
            reviews: 25,
          ),
          TourCard(
            image: 'assets/package-2.jpg',
            title: 'A Tour to the Kingdom',
            price: 520,
            reviews: 20,
          ),
          TourCard(
            image: 'assets/package-3.jpg',
            title: 'Far East\'s Secret Beauty',
            price: 660,
            reviews: 40,
          ),
        ],
      ),
    );
  }
}

class TourCard extends StatelessWidget {
  final String image;
  final String title;
  final int price;
  final int reviews;

  const TourCard({
    required this.image,
    required this.title,
    required this.price,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(image, fit: BoxFit.cover, width: 100, height: 100),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0, // Daha küçük metin boyutu
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Reviews: $reviews',
                  style: TextStyle(fontSize: 12.0), // Daha küçük metin boyutu
                ),
                Text(
                  '\$$price per person',
                  style: TextStyle(fontSize: 12.0), // Daha küçük metin boyutu
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }
}

class GallerySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Photos From Travellers',
            style: TextStyle(
              fontSize: 18.0, // Daha küçük metin boyutu
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            children: [
              Image.asset('assets/gallery-1.jpg', fit: BoxFit.cover),
              Image.asset('assets/gallery-2.jpg', fit: BoxFit.cover),
              Image.asset('assets/gallery-3.jpg', fit: BoxFit.cover),
              Image.asset('assets/gallery-4.jpg', fit: BoxFit.cover),
              Image.asset('assets/gallery-5.jpg', fit: BoxFit.cover),
              Image.asset('assets/hero-banner.jpg', fit: BoxFit.cover),
            ],
          ),
        ],
      ),
    );
  }
}
