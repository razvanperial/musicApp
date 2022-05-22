import 'package:flutter/material.dart';
import 'package:musicapp/views/videoplayer_view.dart';
import 'package:musicapp/widgets/call_to_action.dart';

class ChoiceView extends StatefulWidget {
  const ChoiceView({Key? key}) : super(key: key);

  @override
  State<ChoiceView> createState() => _ChoiceViewState();
}

class _ChoiceViewState extends State<ChoiceView> {
  String dropdownValue = 'rihanna.mp4';
  String finalValue = 'rihanna.mp4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Pick you Artist'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.redAccent,
                    Colors.blueAccent,
                    Colors.purpleAccent
                  ]),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 5)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  iconSize: 50,
                  itemHeight: 80,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 160,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                  underline: Container(
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    finalValue = newValue!;
                  },
                  items: <String>[
                    'rihanna.mp4',
                    'RedHotChiliPeppers.mp4',
                    'TheWeeknd.mp4',
                    'Queen.mp4'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 200),
            CallToAction(
                title: 'See result',
                route: VideoPlayerScreen(
                    title1: finalValue,
                    title2: 'spiderman.mp4',
                    barTitle: 'Enjoy')),
          ],
        ),
      ),
    );
  }
}
