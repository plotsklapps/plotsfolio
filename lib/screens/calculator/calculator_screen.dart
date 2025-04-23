import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:plotsfolio/screens/calculator/calculator_sidemenu.dart';
import 'package:plotsfolio/state/sidemenu_open.dart';
import 'package:plotsfolio/utils/utils.dart';
import 'package:signals/signals_flutter.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        // Clear the text field and the result.
        _controller.clear();
        _result = '';
      } else if (value == '←') {
        // Remove the last character.
        _controller.text = _controller.text.isNotEmpty
            ? _controller.text.substring(0, _controller.text.length - 1)
            : '';
      } else if (value == '=' || value == '\n') {
        // Calculate the result.
        _calculateResult();
      } else {
        // Otherwise, the value is appended to the text field.
        _controller.text += value;
      }
    });
  }

  void _calculateResult() {
    // Use the math_expressions package to parse and evaluate the expression.
    final String expression = _controller.text.replaceAll('√', 'sqrt');
    if (expression.isEmpty) return;
    try {
      final GrammarParser parser = GrammarParser();
      final Expression exp = parser.parse(expression);
      final ContextModel contextModel = ContextModel();
      final dynamic eval = exp.evaluate(EvaluationType.REAL, contextModel);

      // Store the evaluated result in the _result String variable.
      _result = eval.toString();
    } on Exception {
      // If an error occurs, set the result to 'Error'.
      _result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.lightGrey,
      appBar: AppBar(
        backgroundColor: Utils.gunMetal,
        title: const Text(
          Utils.calculatorTitle,
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
          if (sSideMenu.watch(context))
            const SizedBox.shrink()
          else
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(LucideIcons.info),
                onPressed: () {
                  // Show a modalbottomsheet with the same contents as
                  showModalBottomSheet<Widget>(
                    showDragHandle: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: CalculatorSideMenu(),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              // Use SingleChildScrollView to allow the keyboard to come up,
              // without getting an overflow issue.
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    // Display the result in a Text widget.
                    _result,
                    style: const TextStyle(
                      color: Utils.gunMetal,
                      fontSize: 72,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextField(
                controller: _controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                  color: Utils.gunMetal,
                  fontSize: 48,
                ),
                cursorColor: Utils.gunMetal,
                textAlign: TextAlign.right,
                onSubmitted: (String value) {
                  // When the user presses the enter key on the keyboard it
                  // will calculate the result immediately.
                  _onButtonPressed('\n');
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ), // This is where ChatGPT helped a little bit. It's an easy way to
            // create a grid of buttons.
            ..._buildButtonRows(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtonRows() {
    // First, define the labels for the buttons.
    const List<List<String>> buttonLabels = <List<String>>[
      <String>['1', '2', '3', '+', '←'],
      <String>['4', '5', '6', '-', '√'],
      <String>['7', '8', '9', '/', '^'],
      <String>['C', '0', '.', '*', '='],
    ];

    // Then, create the buttons using the labels.
    return buttonLabels.map((List<String> row) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: row.map(
            (String label) {
              return CalculatorButton(
                color: label == 'C' ? Colors.red : Utils.gunMetal,
                value: label,
                onPressed: _onButtonPressed,
              );
            },
          ).toList(),
        ),
      );
    }).toList();
  }
}

// This is a custom widget that represents a button in the calculator.
class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    required this.color,
    required this.value,
    required this.onPressed,
    super.key,
  });
  final Color color;
  final String value;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    // This is a custom widget that represents a button in the calculator.
    String getButtonText(String value) {
      return value;
    }

    return SizedBox(
      width: 64,
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          onPressed(value);
        },
        child: Text(
          getButtonText(value),
          style: const TextStyle(color: Utils.lightGrey, fontSize: 20),
        ),
      ),
    );
  }
}
