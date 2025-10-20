abstract class MonyHelper {
  static String formatMoney({required double amount, String? currency}) {
    // Convert to string and remove trailing zeros after decimal point
    String numStr = amount.toStringAsFixed(2).replaceAll(RegExp(r'\.0+$'), '');

    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String result = numStr.replaceAllMapped(reg, (Match m) => '${m[1]},');
    if (currency != null) {
      return "$result $currency";
    }
    return result;
  }
}
