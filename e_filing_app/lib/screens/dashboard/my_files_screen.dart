import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/file_provider.dart';

class MyFilesScreen extends StatelessWidget {
  const MyFilesScreen({super.key});

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
              'My Files',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                child: fileProvider.myFiles.isEmpty
                    ? const Center(
                        child: Text('No files found'),
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
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Action')),
                          ],
                          rows: fileProvider.myFiles.asMap().entries.map((entry) {
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
                                      color: _getStatusColor(file.status),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      file.status,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.visibility),
                                        onPressed: () {
                                          _showFileDetails(context, file);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          // Handle edit
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          // Handle delete
                                        },
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'draft':
        return Colors.grey;
      case 'in process':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  void _showFileDetails(BuildContext context, dynamic file) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('File Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('File Type: ${file.fileType}'),
              Text('Subject: ${file.subject}'),
              Text('Reference No: ${file.referenceNo}'),
              Text('Sender: ${file.sender}'),
              Text('Receiver: ${file.receiver}'),
              Text('Status: ${file.status}'),
              Text('Created: ${file.createdDate}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
