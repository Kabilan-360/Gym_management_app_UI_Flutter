import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gym_management_app/adminScreen/dashboard/reports_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard & Analytics')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key Metrics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Key metrics rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyticsWidget(
                    title: 'Total Members',
                    value: '250',
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                  AnalyticsWidget(
                    title: 'Active Members',
                    value: '200',
                    icon: Icons.fitness_center,
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyticsWidget(
                    title: 'Revenue',
                    value: '\$10,000',
                    icon: Icons.attach_money,
                    color: Colors.orange,
                  ),
                  AnalyticsWidget(
                    title: 'Attendance',
                    value: '85%',
                    icon: Icons.show_chart,
                    color: Colors.purple,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Monthly Trends',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: _buildAttendanceChart(),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportsScreen()),
                  );
                },
                child: Text('View Reports'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceChart() {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                const style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
                switch (value.toInt()) {
                  case 0:
                    return Text('Jan', style: style);
                  case 1:
                    return Text('Feb', style: style);
                  case 2:
                    return Text('Mar', style: style);
                  case 3:
                    return Text('Apr', style: style);
                  case 4:
                    return Text('May', style: style);
                  default:
                    return Text('');
                }
              },
            ),
          ),
        ),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 70, color: Colors.blue)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 75, color: Colors.green)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 80, color: Colors.orange)]),
          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 85, color: Colors.purple)]),
          BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 90, color: Colors.red)]),
        ],
      ),
    );
  }
}

class AnalyticsWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  AnalyticsWidget({required this.title, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}


