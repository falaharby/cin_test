import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FormComponent extends StatefulWidget {
  final bool isDropdown, isNumeric;
  final String label;
  final String? value;
  final List<String> listData;
  final Function(Object?)? onChanged;
  const FormComponent(
      {super.key,
      required this.label,
      required this.isDropdown,
      this.value,
      this.isNumeric = false,
      this.listData = const [],
      this.onChanged});

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.value != null) {
      _controller.text = widget.value ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: (widget.value != null) ? Colors.blue : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: (!widget.isDropdown)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: kIsWeb ? 12 : 3.0),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    keyboardType:
                        (widget.isNumeric) ? TextInputType.number : null,
                    decoration: InputDecoration(
                      hintText: widget.label,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: widget.onChanged,
                  ),
                )
              : DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: widget.value,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: (widget.value != null)
                          ? Colors.blue
                          : Colors.grey[600],
                    ),
                    elevation: 16,
                    hint: Text(
                      widget.label,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    onChanged: widget.onChanged,
                    items: widget.listData
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
        ),
      ],
    );
  }
}
