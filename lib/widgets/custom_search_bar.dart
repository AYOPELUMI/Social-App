import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  CustomSearchBar({
    Key? key,
    required this.searchController,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String selectedFilter = 'All'; // Default filter
  bool isFilterVisible = false; // Toggle visibility of filter options

  // Define filter options
  final List<String> filterOptions = [
    'All',
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Border color from theme
              width: 1.5, // Adjust width of the border
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.searchController,
                  onChanged: widget.onSearchChanged,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.filter_list,
                    color: Theme.of(context)
                        .colorScheme
                        .primary), // Theme color for icon
                onPressed: () {
                  setState(() {
                    isFilterVisible = !isFilterVisible;
                  });
                },
              ),
            ],
          ),
        ),
        // Display the filter options
        if (isFilterVisible)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: filterOptions.map((filter) {
                return ListTile(
                  title: Text(filter),
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                      isFilterVisible = false; // Close the filter options
                    });
                    widget.onSearchChanged(
                        filter); // Apply the filter (e.g., updating the search)
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
