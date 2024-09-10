import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            labelText: 'what would you like to see',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // search logic goes here
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return const CarCard();
        },
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.all(const Radius.circular(10)),
            ),
            child: Image.network(
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.carwale.com%2Fimages%2F&psig=AOvVaw2cd8MfQEig1WAVpZcYyXOS&ust=1725378393215000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMDJocfNpIgDFQAAAAAdAAAAABAE',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      onTap: () {
        // handle item tap
      },
    );
  }
}
