import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{
  RxString imagePath =''.obs;
  Future getImage() async {
    final ImagePicker imagepicker = ImagePicker();
    final image = await imagepicker.pickImage(source: ImageSource.camera);
    if(image != null){
      imagePath.value = image.path.toString();
    }
  }
}