import 'package:flutter/material.dart';

abstract interface class ButtonApp<T> {
  final T value;

  ButtonApp({
    required this.value,
  });

  Widget build(BuildContext context);
}

class ButtonItem1<T> extends ButtonApp<T> {
  final String text;
  final Color color;
  final IconData icon;

  ButtonItem1({
    required super.value,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 160, color: Colors.white70),
        Text(
          text,
          style: TextStyle(
              fontSize: 20, color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class ButtonItem2<T> extends ButtonApp<T> {
  final String text;
  final Color color;
  final IconData icon;

  ButtonItem2({
    required super.value,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 160, color: Colors.white70),
        Text(
          text,
          style: TextStyle(
              fontSize: 20, color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class ButtonItemApp<T> extends StatefulWidget {
  const ButtonItemApp({
    required this.groupValue,
    required this.children,
    required this.onChanged,
    super.key,
  });

  final List<ButtonApp<T>> children;
  final T groupValue;
  final ValueChanged<T> onChanged;

  @override
  State<ButtonItemApp<T>> createState() => _ButtonItemApp<T>();
}

class _ButtonItemApp<T> extends State<ButtonItemApp<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...widget.children.map(
          (a) => Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: a.value == widget.groupValue
                              ? Colors.lightGreen.shade900
                              : const Color.fromARGB(255, 60, 60, 85)),
                      height: 300,
                      width: 225,
                      child: a.build(context)),
                ],
              ),
              onTap: () {
                widget.onChanged.call(a.value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
