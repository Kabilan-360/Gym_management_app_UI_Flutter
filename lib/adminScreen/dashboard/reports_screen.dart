import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Financial Summary'),
            _buildCard(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildReportRow('Revenue', '\$10,000', Colors.green),
                  _buildReportRow('Expenses', '\$5,000', Colors.red),
                  _buildReportRow('Profit', '\$5,000', Colors.blue),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Membership Trends'),
            _buildCard(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildReportRow('New Members', '50', Colors.green),
                  _buildReportRow('Churned Members', '10', Colors.red),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Monthly Trends'),
            _buildCard(content: _buildLineChart(dataPoints: [3, 5, 2, 6, 8, 7, 10, 12, 15, 18, 20, 22])),
            SizedBox(height: 20),
            _buildSectionTitle('Yearly Trends'),
            _buildCard(content: _buildLineChart(dataPoints: [100, 200, 300, 400, 500, 700, 800, 900, 1000, 1200, 1400, 1600])),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    );
  }

  Widget _buildCard({required Widget content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }

  Widget _buildReportRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart({required List<double> dataPoints}) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            // bottomTitles:
            // SideTitles(showTitles: true),
            // leftTitles: SideTitles(showTitles: true),
          ),
          borderData: FlBorderData(show: true),
          minX: 0,
          maxX: dataPoints.length.toDouble() - 1,
          minY: 0,
          maxY: dataPoints.reduce((a, b) => a > b ? a : b) + 10,
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                  .toList(),
              isCurved: true,
              // color: [Colors.teal],
              barWidth: 4,
              belowBarData: BarAreaData(show: true,
                  // colors: [Colors.teal.withOpacity(0.3)]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
