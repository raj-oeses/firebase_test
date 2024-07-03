import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_project/core/constants/enum.dart';

import '../../../../core/api/api_services.dart';
import '../../data/model/add_item_model.dart';
import 'add_item_state.dart';

class AddItemProvider extends StateNotifier<AddItemState> {
  AddItemProvider(super.state);

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //changing the selected data
  //by default it's today
  changeSelectedDay(DateTime dateTime) =>
      state = state.copy(selectedDay: dateTime);

  totalPrice({required String? price, required String? quantity}) {
    if (price != '' && quantity != '') {
      print('price::::::::: $price quantity $quantity');
      try {
        print(
            '${double.parse(price ?? '1.0') * double.parse(quantity ?? '1.0')}');
        state = state.copy(
            totalPrice:
                '${double.parse(price ?? '1.0') * double.parse(quantity ?? '1.0')}');
      } catch (e) {
        print('Exception::::::::::$e');
      }
      // state = state.copy(totalPrice: price * quantity);
    } else {
      state = state.copy(totalPrice: '0.0');
    }
  }

  //change unit Type
  changeUnitType({required String? unitType}) =>
      state = state.copy(unitType: unitType);

//change unit Type
  selectImage({required String? imagePath}) =>
      state = state.copy(imagePath: imagePath);

  //chagning pain intensity of headache
  // changePainIntensity(double intensity) =>
  //     state = state.copy(painIntensity: intensity);

//Store in Firebase Database
  Future<bool> storeData(
      {required AddItemModel data, String? imagePath}) async {
    ApiServices().loadingPg();
    bool isSuccessFul = false;
    try {
      if (imagePath != null) {
        data.imagePath = await uploadImage(imagePath: imagePath);
      }

      await _db
          .collection(AddItemEnum.medicine.toShortString())
          .add(data.toJson())
          .then((value) async => await _db
              .collection(AddItemEnum.medicine.toShortString())
              .doc(value.id)
              .update({'documentId': value.id}).then((docId) {}));

      _resetAllFields();
      isSuccessFul = true;
      Get.back();
    } catch (e) {
      print('Exception:::::::::::');
      return false;
    }
    return isSuccessFul;
  }

  Future<String?> uploadImage({required String? imagePath}) async {
    try {
      //***upload to firebase storage
      String fileName = 'invoices/${DateTime.now().millisecondsSinceEpoch}.png';
      print('fileName $fileName');
      if (imagePath != null) {
        await FirebaseStorage.instance
            .ref(fileName)
            .putFile(File(imagePath))
            .then((element) {
          print('Element $element');
        });
      }

      // return fileUrl the download URL of the uploaded image
      return await FirebaseStorage.instance.ref(fileName).getDownloadURL();

      // print('imageUrl:::::::::::$downloadURL');
    } catch (e) {
      ApiServices().showToast('Error in image $e');
      print('Exception:::::::::::');
    }
    return null;
  }

  void _resetAllFields() => state = state.copy(
      selectedDay: DateTime.now(), imagePath: null, totalPrice: '0.0');

/*// 2. compress file and get file.
  Future<void> testCompressAndGetFile(String filePath) async {
    print('filePath:::$filePath');
    try {
      final Directory tempDir = await getTemporaryDirectory();
      var result = await FlutterImageCompress.compressAndGetFile(
          filePath, '${tempDir.path}/compressed_image.jpg',
          quality: 88, rotate: 180);

      // print(File(filePath).lengthSync());
      print(result?.path);
    } catch (e) {
      print('::::::::::::::::::::$e');
    }

    // return result.path;
  }*/
/*Future<File> _compressImage(File file) async {
    final img.Image? image = img.decodeImage(file.readAsBytesSync());
    if (image == null) {
      throw Exception('Failed to decode image');
    }

    final img.Image resizedImage = img.copyResize(image, width: 800);

    final Directory tempDir = await getTemporaryDirectory();
    final String targetPath = '${tempDir.path}/compressed_image.jpg';

    final File compressedFile = File(targetPath)
      ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 85));

    return compressedFile;
  }*/
//
// //****************************************************************************migraine list section
// Future fetchData() async {
//   ApiServices().loadingPg();
//   try {
//     final migrainList = await _db
//         .collection(IssueTypeEnum.migraine.toShortString())
//         .where("uId", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
//         .limit(maxLimit)
//         .orderBy("selectedDay", descending: true)
//         .get();
//     state = state.copy(
//         migraineList: migrainList.docs
//             .map((e) => MigraineModel.fromSnapshot(e))
//             .toList());
//   } on FirebaseException catch (e) {
//     print('Exception::$e');
//   }
//   Get.back();
// }
//
// //delete Data from firestore
// Future deleteData(MigraineModel? migraineModel) async {
//   ApiServices().loadingPg();
//   try {
//     await _db
//         .collection(IssueTypeEnum.migraine.toShortString())
//         .doc(migraineModel?.documentId)
//         .delete()
//         .then((value) => print('--------------deleted----------'))
//         .catchError((err) => print('--------------error----------'));
//     await fetchData();
//   } on FirebaseException catch (e) {
//     print('Exception::$e');
//   }
//   Get.back();
// }
//
// resetMigraineData({MigraineModel? migraineModel}) {
//   state = state.copy(
//       selectedDay: migraineModel?.selectedDay ?? DateTime.now(),
//       headAceSideIndex: 0,
//       painIntensity: migraineModel?.headAcheIntensity ?? 3);
//   if (migraineModel?.uId == null) {
//     Fluttertoast.showToast(
//       msg: 'Successfully Added',
//       backgroundColor: Colors.green,
//       textColor: Colors.white,
//       toastLength: Toast.LENGTH_SHORT,
//     );
//   }
// }
}

final addItemProvider = StateNotifierProvider<AddItemProvider, AddItemState>(
    (ref) => AddItemProvider(AddItemState())); //
