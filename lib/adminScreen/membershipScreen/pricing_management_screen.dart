import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PricingManagementScreen extends StatefulWidget {
  @override
  _PricingManagementScreenState createState() =>
      _PricingManagementScreenState();
}

class _PricingManagementScreenState extends State<PricingManagementScreen> {
  final List<Map<String, dynamic>> pricingData = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController offerController = TextEditingController();

  void addPricing() {
    if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
      setState(() {
        pricingData.add({
          'id': Uuid().v4(),
          'name': nameController.text,
          'price': double.parse(priceController.text),
          'discount': discountController.text.isNotEmpty
              ? double.parse(discountController.text)
              : 0,
          'offer': offerController.text,
        });
        nameController.clear();
        priceController.clear();
        discountController.clear();
        offerController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name and Price are required!')),
      );
    }
  }

  void deletePricing(String id) {
    setState(() {
      pricingData.removeWhere((item) => item['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Manage Pricing'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.purple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Pricing, Discounts & Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: nameController,
                label: 'Plan Name',
                hintText: 'Enter plan name (e.g., Monthly Plan)',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: priceController,
                label: 'Price',
                hintText: 'Enter price (e.g., 50)',
                inputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: discountController,
                label: 'Discount (%)',
                hintText: 'Enter discount percentage (Optional)',
                inputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: offerController,
                label: 'Promotional Offer',
                hintText: 'Enter offer details (Optional)',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: addPricing,
                child: Text(
                  'Add Pricing',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Current Pricing and Offers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              pricingData.isEmpty
                  ? Center(
                child: Text(
                  'No pricing data available.',
                  style: TextStyle(color: Colors.white70),
                ),
              )
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: pricingData.length,
                itemBuilder: (context, index) {
                  final item = pricingData[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Text(
                        'Price: \$${item['price']}\n'
                            'Discount: ${item['discount']}%\n'
                            'Offer: ${item['offer'] ?? "None"}',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deletePricing(item['id']),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
