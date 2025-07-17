import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/file_provider.dart';

class ActionRequiredScreen extends StatelessWidget {
  const ActionRequiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fileProvider = context.watch<FileProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Files Action Required',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                child: fileProvider.actionRequiredFiles.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.warning_amber, size: 64, color: Colors.orange),
                            SizedBox(height: 16),
                            Text(
                              'No files requiring action',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('S.No')),
                            DataColumn(label: Text('File Type')),
                            DataColumn(label: Text('Subject')),
                            DataColumn(label: Text('Reference No.')),
                            DataColumn(label: Text('Sender')),
                            DataColumn(label: Text('Sending Date')),
                            DataColumn(label: Text('Action Required')),
                            DataColumn(label: Text('Action')),
                          ],
                          rows: fileProvider.actionRequiredFiles.asMap().entries.map((entry) {
                            final index = entry.key + 1;
                            final file = entry.value;
                            return DataRow(
                              cells: [
                                DataCell(Text(index.toString())),
                                DataCell(Text(file.fileType)),
                                DataCell(Text(file.subject)),
                                DataCell(Text(file.referenceNo)),
                                DataCell(Text(file.sender)),
                                DataCell(Text(
                                  '${file.sendingDate.day}/${file.sendingDate.month}/${file.sendingDate.year}',
                                )),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'Action Required',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // Handle view details
                                        },
                                        child: const Text('View Details'),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Handle take action
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Text('Take Action'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
