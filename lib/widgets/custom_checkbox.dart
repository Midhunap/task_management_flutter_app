import 'package:flutter/material.dart';
import 'package:task_management_app/controller/const.dart';

import '../controller/colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.initialValue = false})
      : super(key: key);

  final String label;
  final ValueChanged<bool> onChanged;
  final bool initialValue;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _value = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _value = !_value;
                widget.onChanged(_value);
              });
            },
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _value ? Colors.transparent : purpleColor,
                border: Border.all(width: 2, color: purpleColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 1,
                ),
                child: _value
                    ? const Icon(
                        Icons.check,
                        color: purpleColor,
                        size: 17,
                      )
                    : const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 17,
                      ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            widget.label,
            style: const TextStyle(
                fontSize: 14.5,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
