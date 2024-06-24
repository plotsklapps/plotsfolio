import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:plotsfolio/utils/utils.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  // TextEditingController is used to control the text field.
  final TextEditingController _controller = TextEditingController();

  // The result of the calculation as a String, instantiated as an empty string.
  String _result = '';

  void _onButtonPressed(String value) {
    // This function is called when any button is pressed.
    // The value can be a number, an operator, or a special character.
    setState(() {
      if (value == 'C') {
        // If the value is 'C', the text field is cleared and the result is set
        // to an empty string.
        _controller.clear();
        _result = '';
      } else if (value == '←') {
        // If the value is '←', the last character in the text field is removed.
        _controller.text = _controller.text.isNotEmpty
            ? _controller.text.substring(0, _controller.text.length - 1)
            : '';
      } else if (value == '=' || value == '\n') {
        // If the value is '=' or the user hits the enter key, the result is
        // calculated.
        _calculateResult();
      } else {
        // Otherwise, the value is appended to the text field.
        _controller.text += value;
      }
    });
  }

  void _calculateResult() {
    try {
      // Use the math_expressions package to parse and evaluate the expression.
      final Parser parser = Parser();
      final Expression exp =
          parser.parse(_controller.text.replaceAll('√', 'sqrt'));
      final ContextModel contextModel = ContextModel();
      final double eval =
          exp.evaluate(EvaluationType.REAL, contextModel) as double;

      // Store the evaluated result in the _result String variable.
      _result = eval.toString();
    } catch (e) {
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
          'Calculator',
          style: TextStyle(
            color: Utils.lightGrey,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Utils.lightGrey,
        ),
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
                // The text field is controlled by the TextEditingController.
                controller: _controller,
                // This particular keyboard type is used to allow the user to
                // enter numbers and decimal points.
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
            const SizedBox(height: 24),
            // This is where ChatGPT helped a little bit. It's an easy way to
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
                value: label,
                onPressed: _onButtonPressed,
                color: label == 'C' ? Colors.red : Utils.gunMetal,
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
    required this.value,
    required this.onPressed,
    this.color = Utils.gunMetal,
    super.key,
  });
  final String value;
  final void Function(String) onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // IconButton is still the GOAT for creating buttons with icons.
    return IconButton(
      icon: FaIcon(
        _getIconData(value),
        color: color,
      ),
      onPressed: () {
        onPressed(value);
      },
    );
  }

  // This function maps the button label to the corresponding FontAwesome icon.
  IconData _getIconData(String value) {
    switch (value) {
      case '1':
        return FontAwesomeIcons.one;
      case '2':
        return FontAwesomeIcons.two;
      case '3':
        return FontAwesomeIcons.three;
      case '4':
        return FontAwesomeIcons.four;
      case '5':
        return FontAwesomeIcons.five;
      case '6':
        return FontAwesomeIcons.six;
      case '7':
        return FontAwesomeIcons.seven;
      case '8':
        return FontAwesomeIcons.eight;
      case '9':
        return FontAwesomeIcons.nine;
      case '0':
        return FontAwesomeIcons.zero;
      case '+':
        return FontAwesomeIcons.plus;
      case '-':
        return FontAwesomeIcons.minus;
      case '*':
        return FontAwesomeIcons.xmark;
      case '/':
        return FontAwesomeIcons.divide;
      case '^':
        return FontAwesomeIcons.superscript;
      case '√':
        return FontAwesomeIcons.squareRootVariable;
      case '.':
        return FontAwesomeIcons.codeCommit;
      case '=':
        return FontAwesomeIcons.equals;
      case 'C':
        return FontAwesomeIcons.c;
      case '←':
        return FontAwesomeIcons.deleteLeft;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
