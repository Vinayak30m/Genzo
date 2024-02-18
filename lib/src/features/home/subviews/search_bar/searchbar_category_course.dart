import 'package:flutter/material.dart';
import 'package:genzo/src/features/home/subviews/search_bar/searched_category_courses.dart';

class CategorySearchBar extends StatefulWidget {
  final String categoryname;

  const CategorySearchBar({super.key, required this.categoryname});

  @override
  State<CategorySearchBar> createState() => _CategorySearchBarState();
}

class _CategorySearchBarState extends State<CategorySearchBar> {
  String _searchedvalue = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.041,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(0.0),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            _searchedvalue = value;
          });
        },
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search for courses',
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
          prefixIcon: Icon(
            Icons.search,
            size: 18,
            color: Colors.grey,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchedCategorycourse(
                        searchedValue: _searchedvalue,
                        categoryname: widget.categoryname);
                  },
                ),
              );
            },
            child: Icon(
              Icons.arrow_forward,
              size: 18,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
