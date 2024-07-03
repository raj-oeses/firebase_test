// import 'dart:developer';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:metgo/app_setup/errors/failure.dart';
// import 'package:metgo/business/features/event/data/models/business_detail.dart';
// import 'package:metgo/business/features/landing_page/presentation/pages/domain/repo/i_landing_repo.dart';
// import 'package:metgo/config/end_points.dart';
// import 'package:metgo/core/init/auth_credentials.dart';
//
// import '../../../../../../app_setup/remote_services/http_service_impl.dart';
// //
// class LandingRepo extends ILandingRepo {
//   @override
//   Future<Either<Failure, BusinessDetail>?> createBusiness() async {
//     try {
//       return await HttpServiceImpl().post(businessListUrl,options:  Options(headers: {
//         'accept': 'application/json',
//         'content-type': 'application/json',
//         "Authorization": "Bearer ${AuthCredentials.getUserData(userData: UserDataEnum.access)}",
//       })).then((value) =>
//           value.fold((l) => Left(l),
//               (r) => Right(businessDetailFromJson(r.toString()))));
//     } catch (e) {
//       log('Exception ::::---===${e}');
//     }
//     return null;
//   }
//
// }
