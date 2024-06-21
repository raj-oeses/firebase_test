import '../../feature/assessment_page/data/model/animal_model.dart';
import '../../feature/home_page/data/model/history_model.dart';

List<HistoryModel> historyList = [
  HistoryModel(
      testName: "Physical Examination",
      sn: 'Z00.00',
      name: 'Emerson Calzoni',
      age: '36',
      gender: 'Male',
      date: DateTime.now(),
      id: '1',
      weight: '84'),
  HistoryModel(
      testName: "Diagnostic Tests",
      sn: 'Z01.80',
      name: 'Davis Culhane',
      age: '41',
      gender: 'Male',
      date: DateTime.now().subtract(const Duration(days: 2)),
      id: '2',
      weight: '44'),
  HistoryModel(
      testName: "Diagnostic Tests",
      sn: 'Z01.80',
      name: 'Davis Culhane',
      age: '41',
      gender: 'Male',
      date: DateTime.now().subtract(const Duration(days: 2)),
      id: '2',
      weight: '44'),
];

List<String> assessmentSelectableItems = [
  'Jill bought candies.',
  'Jill has a dog as a pet.',
  'Jill took a cab.'
];
const readSentence =
    'Proin ultrices fringilla et scelerisque sed duis massa nulla. Eget arcu urna ipsum in neque ornare. Integer placerat rhoncus purus est ut ultrices. Pharetra amet faucibus tincidunt mattis in enim. Duis pharetra integer adipiscing quisque elementum lacus porta. Sit diam aliquam quisque purus tortor.Ut turpis consectetur massa libero. Habitant lobortis dictum pretium et tortor\n\nfacilisi in enim porttitor. Purus porta pulvinar sit ultrices aliquam ultrices lacus quam. Gravida etiam facilisis enim purus ornare quis donec leo dignissim. Etiam at non aliquam quis.\n\nPellentesque pellentesque at amet vitae turpis hac in. Felis eu purus vel interdum accumsan lorem dictu.';

//--------animal model list
List<AnimalModel> animalList = [
  AnimalModel(name: 'Chicken', image: 'chicken'),
  AnimalModel(name: 'Dog', image: 'dog'),
  AnimalModel(name: 'Horse', image: 'horse'),
];
