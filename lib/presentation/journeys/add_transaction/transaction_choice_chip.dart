import 'package:flutter/material.dart';

class TransactionChoiceChip extends StatefulWidget {
  final List<String> transactionCategories;
  final String? initialSelectedChip;
  final Function(String) onItemSelected;

  TransactionChoiceChip(
      {Key? key,
      required this.initialSelectedChip,
      required this.transactionCategories,
      required this.onItemSelected})
      : super(key: key);

  @override
  _TransactionChoiceChipState createState() => _TransactionChoiceChipState();
}

class _TransactionChoiceChipState extends State<TransactionChoiceChip> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialSelectedChip;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: widget.transactionCategories.map((e) => _buildChip(e)).toList(),
    );
  }

  Widget _buildChip(String title) {
    return ChoiceChip(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      label: Text(title),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      labelStyle:
          Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),
      selected: title == selectedItem,
      onSelected: (isSelected) {
        if (isSelected) {
          setState(() {
            selectedItem = null;
            selectedItem = title;
            widget.onItemSelected(title);
          });
        }
      },
      selectedColor: Theme.of(context).primaryColor,
    );
  }
}
