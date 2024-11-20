import 'package:flutter/material.dart';

class MarketingPage extends StatefulWidget {
  const MarketingPage({super.key});

  @override
  State<MarketingPage> createState() => _MarketingPageState();
}

class _MarketingPageState extends State<MarketingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Marketing'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(
                    10), // Optional: to add rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color with opacity
                    spreadRadius: 2, // How much the shadow spreads
                    blurRadius: 10, // How soft or sharp the shadow is
                    offset: const Offset(
                        0, 3), // Position of the shadow (horizontal, vertical)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
