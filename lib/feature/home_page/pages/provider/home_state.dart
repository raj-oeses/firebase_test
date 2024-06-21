// import '../../data/model/business_list_models.dart';
//
// class MyBusinessState {
//   final bool fetching;
//   final bool querying;
//   final String? error;
//   final List<Datum>? myBusinessList;
//   final Meta? pagination;
//
//   MyBusinessState(
//       {this.fetching = false,
//       this.querying = false,
//       this.error,
//       this.pagination,
//       this.myBusinessList});
//
//   MyBusinessState copy(
//           {bool? fetching,
//           bool? querying,
//           String? error,
//           Meta? pagination,
//           List<Datum>? myBusinessList}) =>
//       MyBusinessState(
//           fetching: fetching ?? this.fetching,
//           querying: querying ?? this.querying,
//           error: error != null
//               ? error.isEmpty
//                   ? null
//                   : error
//               : this.error,
//           myBusinessList: myBusinessList ?? this.myBusinessList,
//           pagination: pagination ?? this.pagination);
// }
