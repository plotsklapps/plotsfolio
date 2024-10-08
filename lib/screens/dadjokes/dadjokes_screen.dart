import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:signals/signals_flutter.dart';

// ignore_for_file: avoid_dynamic_calls

const String apiUrl = 'https://dad-jokes.p.rapidapi.com/random/joke';
const String apiHost = 'dad-jokes.p.rapidapi.com';
const String apiKey = '31f0e18aa0msh7ac1cf7f28b021cp1a3527jsnf0116cb148cc';

// Initial joke text
final Signal<String> sJokeSetup = signal<String>('Loading...');
// Initial punchline text
final Signal<String> sPunchline = signal<String>('Tap for punchline...');
// Bool for punchline visibility
final Signal<bool> sIsPunchlineVisible = signal<bool>(false);

// Screen for displaying dad jokes
class DadJokesScreen extends StatefulWidget {
  const DadJokesScreen({super.key});

  @override
  State<DadJokesScreen> createState() {
    return DadJokesScreenState();
  }
}

class DadJokesScreenState extends State<DadJokesScreen> {
  // Fetches a joke from the API
  Future<void> fetchJoke() async {
    // Hide punchline while fetching
    sIsPunchlineVisible.value = false;

    // Send GET request to dad-jokes API
    final http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': apiHost,
      },
    );

    // If the request is successful
    if (response.statusCode == 200) {
      // Decode JSON response
      final dynamic data = jsonDecode(response.body);
      // Get joke setup
      final String setup = data['body'][0]['setup'] as String;
      // Get joke punchline
      final String punchline = data['body'][0]['punchline'] as String;
      // Update joke text and punchline text
      sJokeSetup.value = setup;
      sPunchline.value = punchline;
    } else {
      // If the request fails
      sJokeSetup.value = 'Failed to load joke';
      sPunchline.value = '';
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to fetch the dad joke'),
          ),
        );
      }
    }
  }

  // Shows the punchline
  void showPunchline() {
    // Make punchline visible
    sIsPunchlineVisible.value = true;
  }

  // Fetch joke when screen is initialized
  @override
  void initState() {
    super.initState();
    unawaited(fetchJoke());
  }

  // Build UI for the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dad Jokes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                const Text(
                  'Get Ready to Laugh!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      sJokeSetup.watch(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (sIsPunchlineVisible.value)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        sPunchline.watch(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ).animate().scale(duration: 500.ms)
                else
                  Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Press the button for the punchline!',
                        textAlign: TextAlign.center,
                      ).animate().flipH(duration: 500.ms),
                    ),
                  ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sIsPunchlineVisible.watch(context)
              ? unawaited(fetchJoke())
              : showPunchline();
        },
        tooltip:
            sIsPunchlineVisible.value ? 'Get another joke' : 'Show punchline',
        child: sIsPunchlineVisible.watch(context)
            ? const FaIcon(FontAwesomeIcons.rotate)
            : const FaIcon(FontAwesomeIcons.eye),
      ),
    );
  }
}
