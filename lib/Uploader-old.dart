import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uploader extends StatefulWidget {
  final String path;
  final File file;

  Uploader({this.path, this.file});

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage = FirebaseStorage.instance;

//
//  FirebaseStorage(storageBucket: 'gs://fireship-lessons.appspot.com');
  String get status {
    String result;
    if (_uploadTask.isComplete) {
      if (_uploadTask.isSuccessful) {
        result = 'Complete';
      } else if (_uploadTask.isCanceled) {
        result = 'Canceled';
      } else {
        result = 'Failed ERROR: ${_uploadTask.lastSnapshot.error}';
      }
    } else if (_uploadTask.isInProgress) {
      result = 'Uploading';
    } else if (_uploadTask.isPaused) {
      result = 'Paused';
    }
    return result;
  }

  StorageUploadTask _uploadTask;

  /// Starts an upload task
  void _startUpload(File file, String path) {
    /// Unique file name for the file
    String filePath = 'harvests/images/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(file);
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
              children: [
                Text(
                  "Harvest Image Upload\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                if (_uploadTask.isComplete)
                  Column(
                    children: <Widget>[
                      Text('🎉🎉🎉\nUpload Successful!'),
                    ],
                  ),

                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),

                if (_uploadTask.isInProgress)
                  FlatButton(
                    child: Icon(Icons.pause),
                    onPressed: _uploadTask.pause,
                  ),

                // Progress bar
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} % '),
              ],
            );
          });
    } else {
      _startUpload(widget.file, widget.path);
    }
  }
}
