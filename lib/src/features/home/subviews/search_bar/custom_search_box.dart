import 'package:flutter/material.dart';

class CustomSearchBox extends StatefulWidget {
  final String hintText;

  const CustomSearchBox({Key? key, required this.hintText}) : super(key: key);

  @override
  _CustomSearchBoxState createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> {
  TextEditingController _searchController = TextEditingController();
  List<String> searchKeywords = [
    'palm reading',
    'vedic science',
    'daily essential',
    'banking',
    'mind reading',
    'astrology',
    'myth',
    'genzo',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.041,
      decoration: BoxDecoration(
          color: Color(0xFFECF0F1), borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.all(0.0),
      child: TextField(
        maxLines: null,
        controller: _searchController,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF999999)),
          prefixIcon: Icon(
            Icons.search,
            size: 18,
            color: Color(0xFF999999),
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
