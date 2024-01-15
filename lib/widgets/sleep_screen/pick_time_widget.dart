import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../contants.dart';

class PickTimeWidget extends StatefulWidget {
  const PickTimeWidget(
      {super.key,
      required this.iconDir,
      required this.title,
      required this.time});

  final String iconDir;
  final String title;
  final String time;

  @override
  State<PickTimeWidget> createState() => _PickTimeWidgetState();
}

class _PickTimeWidgetState extends State<PickTimeWidget> {
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _time = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      height: 250,
      width: 120,
      child: Column(children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              _time.format(context).toString(),
              style: const TextStyle(fontFamily: "Barlow", fontSize: 30),
            ),
          ),
        ),
        InkWell(
          onTap: _showTimePicker,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 120,
            height: 125,
            decoration: BoxDecoration(
              border: Border.all(color: kPurple, width: 1.5),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 50,
                      child: SvgPicture.asset(
                        widget.iconDir,
                        color: kPurple,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ]),
          ),
        )
      ]),
    );
  }
}
