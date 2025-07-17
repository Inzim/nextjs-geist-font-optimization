import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import '../../providers/file_provider.dart';

class CreateFileScreen extends StatefulWidget {
  const CreateFileScreen({super.key});

  @override
  State<CreateFileScreen> createState() => _CreateFileScreenState();
}

class _CreateFileScreenState extends State<CreateFileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _referenceNoController = TextEditingController();
  final _contentController = quill.QuillController.basic();
  String? _selectedFileType;
  String? _selectedSection;
  String? _selectedForwardTo;
  String? _selectedFlagType;

  @override
  void dispose() {
    _subjectController.dispose();
    _referenceNoController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fileProvider = context.watch<FileProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create New File',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedFileType,
                              decoration: const InputDecoration(
                                labelText: 'File Type',
                                border: OutlineInputBorder(),
                              ),
                              items: fileProvider.fileTypes
                                  .map((type) => DropdownMenuItem(
                                        value: type,
                                        child: Text(type),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedFileType = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select a file type';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _subjectController,
                              decoration: const InputDecoration(
                                labelText: 'File Subject',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter file subject';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _referenceNoController,
                        decoration: const InputDecoration(
                          labelText: 'Reference No.',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter reference number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'File Content',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            quill.QuillToolbar.simple(
                              configurations: quill.QuillSimpleToolbarConfigurations(
                                controller: _contentController,
                                sharedConfigurations: const quill.QuillSharedConfigurations(
                                  locale: Locale('en'),
                                ),
                              ),
                            ),
                            Container(
                              height: 200,
                              padding: const EdgeInsets.all(8),
                              child: quill.QuillEditor.basic(
                                configurations: quill.QuillEditorConfigurations(
                                  controller: _contentController,
                                  sharedConfigurations: const quill.QuillSharedConfigurations(
                                    locale: Locale('en'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedSection,
                              decoration: const InputDecoration(
                                labelText: 'Section',
                                border: OutlineInputBorder(),
                              ),
                              items: fileProvider.sections
                                  .map((section) => DropdownMenuItem(
                                        value: section,
                                        child: Text(section),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedSection = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select a section';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedForwardTo,
                              decoration: const InputDecoration(
                                labelText: 'Forward To',
                                border: OutlineInputBorder(),
                              ),
                              items: fileProvider.forwardToOptions
                                  .map((option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(
                                          option,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedForwardTo = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select forward to';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedFlagType,
                              decoration: const InputDecoration(
                                labelText: 'Choose Flag Type',
                                border: OutlineInputBorder(),
                              ),
                              items: fileProvider.flagTypes
                                  .map((flag) => DropdownMenuItem(
                                        value: flag,
                                        child: Text(flag),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedFlagType = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select flag type';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Handle file attachment
                              },
                              icon: const Icon(Icons.attach_file),
                              label: const Text('Flag Attachment'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle preview
                            },
                            child: const Text('Preview'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: fileProvider.isLoading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      final success = await fileProvider.createNewFile(
                                        fileType: _selectedFileType!,
                                        subject: _subjectController.text,
                                        referenceNo: _referenceNoController.text,
                                        content: _contentController.document.toPlainText(),
                                        section: _selectedSection!,
                                        forwardTo: _selectedForwardTo!,
                                        flagType: _selectedFlagType!,
                                      );
                                      if (success && mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('File created successfully'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        _formKey.currentState!.reset();
                                        _contentController.clear();
                                        setState(() {
                                          _selectedFileType = null;
                                          _selectedSection = null;
                                          _selectedForwardTo = null;
                                          _selectedFlagType = null;
                                        });
                                      }
                                    }
                                  },
                            child: fileProvider.isLoading
                                ? const CircularProgressIndicator()
                                : const Text('Submit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
