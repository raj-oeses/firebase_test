// import 'dart:async';
//
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:metgo/business/features/landing_page/presentation/pages/data/landing_repo.dart';
//
// import '../../../../../../app_setup/errors/failure.dart';
// import '../../../../event/data/models/business_detail.dart';
// import 'landing_page_state.dart';
//
// class LandingPageProvider extends StateNotifier<LandingPageState> {
//   LandingPageProvider(super._state);
//
//   Future<Either<Failure, BusinessDetail>?> createBusiness() async {
//     state = state.copy(isBusinessCreatedLoading: true);
//     Either<Failure, BusinessDetail>? response =
//         await LandingRepo().createBusiness();
//     state = state.copy(isBusinessCreatedLoading: false);
//     return response;
//   }
//
//   floatingActionButton(bool showFloating){
//     state=state.copy(showFloatingAction: showFloating);
//   }
// }
//
// final landingProvider =
//     StateNotifierProvider<LandingPageProvider, LandingPageState>(
//         (ref) => LandingPageProvider(LandingPageState()));
