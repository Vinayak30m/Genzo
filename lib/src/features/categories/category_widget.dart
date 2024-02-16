import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:genzo/src/features/categories/categories_screen.dart';
import 'package:genzo/src/features/home/widgets/categorybox_widget.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _categoryStream =
        FirebaseFirestore.instance.collection('categories').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _categoryStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        }

        return Container(
          height: 200,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1.1,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: ((context, index) {
              final categoryData = snapshot.data!.docs[index];
              return CategoryBoxWidget(
                image: categoryData['image'],
                text: categoryData['categoryName'],
                onPressed: () {
                  print(categoryData['categoryName']);
                  setState(() {
                    _selectedCategory = categoryData['categoryName'];
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return (CategoriesScreen(
                          categoryName: categoryData['categoryName'],
                        ));
                      },
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }
}
