mixin TransactionEntryValidationMixin {
  bool isInputValid(String amount) {
    final inputAmount = double.tryParse(amount);
    return inputAmount != null && inputAmount != 0.0;
  }

  bool isDescriptionValid(String desc) {
    return desc.isNotEmpty;
  }

  bool isCategoryValid(String? selectedCategory) {
    return selectedCategory != null;
  }
}
