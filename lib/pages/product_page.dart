import 'package:dashboard_flutter/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static const String route = '/products';

  @override
  Widget build(BuildContext context) {
    print("Buildou ProductPage");

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Products",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Adicionar"),
                ),
              ),
            ],
          ),
          Card(
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Age',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Role',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Sarah')),
                    DataCell(Text('19')),
                    DataCell(Text('Student')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Janine')),
                    DataCell(Text('43')),
                    DataCell(Text('Professor')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('William')),
                    DataCell(Text('27')),
                    DataCell(Text('Associate Professor')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
