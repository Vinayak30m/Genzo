import 'package:flutter/material.dart';
import 'package:genzo/src/features/home/subviews/search_bar/searched_course.dart';

class CategorySearch extends StatefulWidget {
  @override
  State<CategorySearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends State<CategorySearch> {
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
                    return searchedCourses(searchedValue: _searchedvalue);
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

