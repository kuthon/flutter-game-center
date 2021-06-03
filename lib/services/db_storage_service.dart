import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class DbStorageService {

  static Future<String?> _uploadFile({ required File file, required String name}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("$name${DateTime.now().toString()}");
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask;
    String url = await ref.getDownloadURL();
    return url;
  }

  static Future<String?> uploadImageFrom({required ImageSource source}) async {
    String? url;
    final PickedFile? image = await ImagePicker().getImage(source: source);

    if (image != null) {
      final imageFile = File(image.path);
      url = await _uploadFile(file: imageFile, name: "image");
    }

    return url;
  }

  static Future<String?> uploadVideoFrom({required ImageSource source}) async {
    String? url;
    final PickedFile? video = await ImagePicker().getVideo(source: source);

    if (video != null) {
      final imageFile = File(video.path);
      url = await _uploadFile(file: imageFile, name: "video");
    }

    return url;
  }

}