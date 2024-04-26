import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notion_budget/data/get_category_color.dart';
import 'package:flutter_notion_budget/models/item_model.dart';

class SpendingChart extends StatelessWidget {
  final List<Item> items;

  const SpendingChart({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final spending = <String, double>{};

    items.forEach(
      (item) => spending.update(
        item.category,
        (value) => value + item.price,
        ifAbsent: () => item.price,
      ),
    );

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 360.0,
          child: PieChart(
            PieChartData(
              sections: spending
                  .map(
                    (category, amount) => MapEntry(
                      category,
                      PieChartSectionData(
                        color: getCategoryColor(category),
                        value: amount,
                        title: '\$${amount.toStringAsFixed(2)}',
                        radius: 100.0,
                      ),
                    ),
                  )
                  .values
                  .toList(),
              sectionsSpace: 0,
            ),
          )),
    );
  }
}
