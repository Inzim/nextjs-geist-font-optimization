import 'package:flutter/material.dart';

class FileItem {
  final String id;
  final String fileType;
  final String subject;
  final String referenceNo;
  final String sender;
  final DateTime sendingDate;
  final String status;
  final String receiver;
  final DateTime? createdDate;

  FileItem({
    required this.id,
    required this.fileType,
    required this.subject,
    required this.referenceNo,
    required this.sender,
    required this.sendingDate,
    required this.status,
    this.receiver = '',
    this.createdDate,
  });
}

class FileProvider with ChangeNotifier {
  List<FileItem> _pendingFiles = [];
  List<FileItem> _myFiles = [];
  List<FileItem> _actionRequiredFiles = [];
  bool _isLoading = false;

  List<FileItem> get pendingFiles => _pendingFiles;
  List<FileItem> get myFiles => _myFiles;
  List<FileItem> get actionRequiredFiles => _actionRequiredFiles;
  bool get isLoading => _isLoading;

  FileProvider() {
    _loadMockData();
  }

  void _loadMockData() {
    // Mock data for My Files
    _myFiles = [
      FileItem(
        id: '1',
        fileType: 'PUC',
        subject: 'testing',
        referenceNo: 'REF001',
        sender: 'Current User',
        sendingDate: DateTime.now().subtract(const Duration(days: 1)),
        status: 'In Process',
        receiver: 'Muhammad Jahangir Khan (Special Secretary)',
        createdDate: DateTime(2025, 7, 14),
      ),
    ];

    // Mock data for pending files (empty initially)
    _pendingFiles = [];

    // Mock data for action required files (empty initially)
    _actionRequiredFiles = [];
  }

  Future<bool> createNewFile({
    required String fileType,
    required String subject,
    required String referenceNo,
    required String content,
    required String section,
    required String forwardTo,
    required String flagType,
    String? attachmentPath,
  }) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    final newFile = FileItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fileType: fileType,
      subject: subject,
      referenceNo: referenceNo,
      sender: 'Current User',
      sendingDate: DateTime.now(),
      status: 'Draft',
      receiver: forwardTo,
      createdDate: DateTime.now(),
    );

    _myFiles.insert(0, newFile);
    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> refreshFiles() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
  }

  void updateFileStatus(String fileId, String newStatus) {
    // Update in my files
    final myFileIndex = _myFiles.indexWhere((file) => file.id == fileId);
    if (myFileIndex != -1) {
      _myFiles[myFileIndex] = FileItem(
        id: _myFiles[myFileIndex].id,
        fileType: _myFiles[myFileIndex].fileType,
        subject: _myFiles[myFileIndex].subject,
        referenceNo: _myFiles[myFileIndex].referenceNo,
        sender: _myFiles[myFileIndex].sender,
        sendingDate: _myFiles[myFileIndex].sendingDate,
        status: newStatus,
        receiver: _myFiles[myFileIndex].receiver,
        createdDate: _myFiles[myFileIndex].createdDate,
      );
    }

    notifyListeners();
  }

  List<String> get fileTypes => ['PUC', 'Memo', 'Letter', 'Report', 'Application'];
  List<String> get sections => ['Finance', 'Administration', 'HR', 'IT', 'Legal'];
  List<String> get flagTypes => ['Urgent', 'Normal', 'Confidential', 'Public'];
  List<String> get forwardToOptions => [
    'Muhammad Jahangir Khan (Special Secretary)',
    'Director General',
    'Deputy Secretary',
    'Assistant Secretary',
  ];
}
