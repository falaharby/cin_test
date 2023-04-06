import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  final ValueChanged<String> onSearch;
  final String text;
  final String hint;
  const SearchComponent({
    Key? key,
    required this.text,
    required this.onSearch,
    required this.hint,
  }) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.search,
        onChanged: widget.onSearch,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 15),
          hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
          filled: true,
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
