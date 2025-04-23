import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:plotsfolio/screens/dadjokes/dadjokes_sidemenu.dart';
import 'package:plotsfolio/state/sidemenu_open.dart';
import 'package:plotsfolio/utils/utils.dart';
import 'package:signals/signals_flutter.dart';

const String kApiUrl = 'https://dad-jokes.p.rapidapi.com/joke/ai/knock-knock';
const String kApiHost = 'dad-jokes.p.rapidapi.com';
const String kApiKey = '4e9b09616amshcb8bc4ff62ef298p15f8d8jsn8527db553cab';

// Initial joke text
final Signal<String> sJokeSetup = signal<String>('Loading...');
// Initial punchline text
final Signal<String> sPunchline = signal<String>('Tap for punchline...');
// Initial joke type text
final Signal<String> sJokeType = signal<String>('');

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
      Uri.parse(kApiUrl),
      headers: <String, String>{
        'X-RapidAPI-Key': kApiKey,
        'X-RapidAPI-Host': kApiHost,
      },
    );

    // If the request is successful
    if (response.statusCode == 200) {
      // Decode JSON response
      final dynamic data = jsonDecode(response.body);
      // Get joke type
      final String type = data['body'][0]['type'] as String;
      // Get joke setup
      final String setup = data['body'][0]['setup'] as String;
      // Get joke punchline
      final String punchline = data['body'][0]['punchline'] as String;
      sJokeType.value = type;
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
      backgroundColor: Utils.lightGrey,
      appBar: AppBar(
        backgroundColor: Utils.gunMetal,
        title: const Text(
          Utils.dadjokesTitle,
          style: TextStyle(
            color: Utils.lightGrey,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Utils.lightGrey,
        ),
        actions: <Widget>[
          // Check the screensize to determine whether to show the info icon.
          if (isSideMenuOpen.watch(context))
            const SizedBox()
          else
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(LucideIcons.info),
                onPressed: () {
                  // Show a modalbottomsheet with the same contents as
                  // CalculatorSideMenu.
                  showModalBottomSheet<void>(
                    showDragHandle: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: DadjokesSidemenu(),
                      );
                    },
                  );
                },
              ),
            ),
        ],
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
                Text(
                  sJokeType.watch(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                if (sIsPunchlineVisible.value)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        sPunchline.value,
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
            ? const Icon(LucideIcons.refreshCcw)
            : const Icon(LucideIcons.eye),
      ),
    );
  }
}
