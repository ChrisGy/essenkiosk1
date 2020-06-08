import 'package:essenkiosk1/firebaseCRUD.dart' show keyPush;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Uploader extends StatelessWidget {
  const Uploader({Key key, this.task, this.dBString, this.pushKey})
      : super(key: key);
  final String dBString;
  final StorageUploadTask task;
  final String pushKey;

  String get status {
    String result;
    if (task.isComplete) {
      if (task.isSuccessful) {
        result = 'Complete';
      } else if (task.isCanceled) {
        result = 'Canceled';
      } else {
        result = 'Failed ERROR: ${task.lastSnapshot.error}';
      }
    } else if (task.isInProgress) {
      result = 'In Progress';
    } else if (task.isPaused) {
      result = 'Paused';
    }
    return result;
  }

  double _bytesTransferRatio(StorageTaskSnapshot snapshot) {
    if (snapshot == null) return 0;
    return ((snapshot.bytesTransferred) / snapshot.totalByteCount) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (BuildContext context,
          AsyncSnapshot<StorageTaskEvent> asyncSnapshot) {
        Widget _title = Text("");
        double _ratio = 0;
        if (asyncSnapshot.hasData) {
          _ratio = _bytesTransferRatio(asyncSnapshot.data.snapshot);
          String url;
          asyncSnapshot.data.snapshot.ref.getDownloadURL().then((_) {
            url = _;
          });
          _title =
              Text('Image upload is $status: ${_ratio ~/ 0.01} % of data sent');
          if (task.isComplete) keyPush(this.pushKey, url);
        } else {
          _title = Text('Starting upload...');
        }
        Widget _uplWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _title,
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              value: _ratio,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Offstage(
                  offstage: !task.isInProgress,
                  child: IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: () => task.pause(),
                  ),
                ),
                Offstage(
                  offstage: !task.isPaused,
                  child: IconButton(
                    icon: const Icon(Icons.file_upload),
                    onPressed: () => task.resume(),
                  ),
                ),
                Offstage(
                  offstage: task.isComplete,
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () => task.cancel(),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            )
          ],
        );
        return _uplWidget;
      },
    );
  }
}
