import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './notifier.dart';

// *****************************************************************

class Screen extends ConsumerStatefulWidget {
  const Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenState();
}

class _ScreenState extends ConsumerState<Screen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String? _currentPath = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(editorProvider, (previous, next) {
      if (next.isLoading) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('保存中...')));
      } else if (next.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('保存に失敗しました')));
      } else if (next.hasValue) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('保存しました')));

        _contentController.clear();
        _titleController.clear();
        setState(() {
          _currentPath = null;
        });

        context.go('/home');
      }
    });

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    setState(() {
                      _currentPath = image.path;
                    });
                  }
                },
                child: Text('画像を選択'),
              ),
              SizedBox(height: 20),
              _currentPath != null
                  ? Image.file(
                      File(_currentPath!),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: TextField(
                    controller: _contentController,
                    decoration: const InputDecoration(
                      labelText: 'Content',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  await ref
                      .read(editorProvider.notifier)
                      .addDiary(
                        _titleController.text,
                        _contentController.text,
                        _currentPath,
                      );
                },
                child: Text('保存'),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
