import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_project/core/constants/constants.dart';
import 'package:test_project/core/utils/properties.dart';
import 'package:test_project/feature/add_item_page/pages/provider/add_item_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/field_validator.dart';
import '../../../../core/utils/select_image.dart';
import '../../../../core/widget/custom_input.dart';
import '../../../auth/pages/signup_screen/pages/components/gender_radio_ui.dart';
import '../../data/model/add_item_model.dart';
import '../provider/add_item_state.dart';

class AddItemBody extends ConsumerStatefulWidget {
  const AddItemBody({super.key});

  @override
  ConsumerState createState() => _AddItemBodyState();
}

class _AddItemBodyState extends ConsumerState<AddItemBody> {
  //----------------------------------------------------------------------------form key
  final _addItemKey = GlobalKey<FormBuilderState>();

  //----------------------------------------------------------------------------controllers
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _invoiceNumber = TextEditingController();

  //**--------------------------------------------------------------------------for images
  List<String?>? imageList = [];
  late AddItemState addItemState;

  @override
  void initState() {
    final addItemState = super.initState();
  }

  @override
  Widget build(BuildContext context) {
    addItemState = ref.watch(addItemProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: FormBuilder(
        key: _addItemKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputFieldUi(
                controller: _nameController,
                hint: 'Product Name',
                title: 'Product Name',
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                // autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: FieldValidator.validateEmptyField,
              ),
              Row(children: [
                Expanded(
                    child: CustomInputFieldUi(
                        controller: _quantityController,
                        hint: 'Product Quantity',
                        title: 'Product Quantity',
                        onChanged: (value) => ref
                            .read(addItemProvider.notifier)
                            .totalPrice(
                                price: _priceController.text.trim(),
                                quantity: _quantityController.text.trim()),
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: FieldValidator.validateEmptyField)),
                widthBox10,
                Expanded(
                    child: CustomInputFieldUi(
                        controller: _priceController,
                        hint: 'Price',
                        title: 'Price',
                        onChanged: (value) => ref
                            .read(addItemProvider.notifier)
                            .totalPrice(
                                price: _priceController.text.trim(),
                                quantity: _quantityController.text.trim()),
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: FieldValidator.validateEmptyField))
              ]),
              Row(
                children: unitType
                    .map(
                      (unitType) => Expanded(
                        child: GenderRadioUi(
                            value: unitType,
                            groupValue: addItemState.unitType,
                            onChanged: (v) => ref
                                .read(addItemProvider.notifier)
                                .changeUnitType(unitType: v),
                            label: unitType),
                      ),
                    )
                    .toList(),
              ),
              const Heading(title: 'Expire Date'),
              FormBuilderDateTimePicker(
                  name: 'Date',
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialValue: DateTime.now(),
                  inputType: InputType.date,
                  format: DateFormat('yyyy-MM-dd'),
                  decoration: InputDecoration(
                      errorMaxLines: 1,
                      errorStyle: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.error,
                          fontSize: 10.0,
                          height: 1.5,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0))),
              const Heading(title: 'Upload Invoice'),
              InkWell(
                onTap: () async {
                  imageList = await SelectImage().showOptions(context);
                  print('imagePath::::::${imageList?.first}');
                  if (imageList != null && imageList!.isNotEmpty) {
                    ref
                        .read(addItemProvider.notifier)
                        .selectImage(imagePath: imageList!.first);
                  }
                },
                child: SizedBox(
                  height: 200,
                  width: screenWidth(context),
                  child: addItemState.imagePath != null
                      ? Image.file(File(addItemState.imagePath ?? ''))
                      : Image.asset(pngImage('upload_image')),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       if (addItemState.imagePath != null) {
              //         await ref
              //             .read(addItemProvider.notifier)
              //             .testCompressAndGetFile( addItemState.imagePath!);
              //       } else {
              //         print('Nullimage ::::::::::::');
              //       }
              //     },
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: AppColors.primaryColor,
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 16.0, vertical: 12.0),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(6.0))),
              //     child: Text('upload'.toUpperCase(),
              //         style: context.textTheme.labelLarge?.copyWith(
              //             fontWeight: FontWeight.bold, color: Colors.white))),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                          key: const Key('login_btn_key'),
                          onPressed: () => _validate(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Add'.toUpperCase(),
                                  style: context.textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              if (addItemState.totalPrice != null) ...[
                                widthBox10,
                                Text('Rs. ${addItemState.totalPrice ?? ''}',
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                              ]
                            ],
                          ))))
            ],
          ),
        ),
      ),
    );
  }

  void _validate() async {
    unFocus();
    if (_addItemKey.currentState!.validate()) {
    bool isSuccessFul=  await ref.read(addItemProvider.notifier).storeData(
          data: AddItemModel(
              productName: _nameController.text.trim(),
              totalBuyAmount: addItemState.totalPrice ?? '0.0',
              cartonQuantity: _quantityController.text.trim()??'',
              cartonPerPrice: _quantityController.text.trim()??'',
              unitType: addItemState.unitType,
              //these are for self use purpose
              uId: FirebaseAuth.instance.currentUser?.uid,
              consignment: 1,
              createdAt: DateTime.now(),
              id: const Uuid().v4(),
              updatedAt: DateTime.now()),
          imagePath: addItemState.imagePath);
    if(isSuccessFul){
      _nameController.clear();
      _quantityController.clear();
      _priceController.clear();
      imageList=[];
    }
    }
  }
}
