import 'package:royal/services/dbservices.dart';

class OfferModel {
  final String date;
  final String desc;
  final String image;
  final String name;
  final load = databaseServices();

  OfferModel({this.date, this.desc, this.image, this.name});

//  static List<OfferModel> getoffer() {
//    return [
//      OfferModel(
//          date: '1/5/2020',
//          desc: 'عرض لفتره محدودهعرض لفتره محدودهعرض لفتره محدوده  ',
//          image:
//          'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/OFFER-arabic-(1).png?alt=media&token=22969023-f7b6-4f1f-ae25-7ded754d1f8f',
//          name: 'Title1'),
//      OfferModel(
//          date: '2/5/2020',
//          desc: 'عرض لفتره محدودهعرض لفتره محدودهعرض لفتره محدوده  ',
//          image:
//          'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/OFFER-arabic-(1).png?alt=media&token=22969023-f7b6-4f1f-ae25-7ded754d1f8f',
//          name: 'Title2'),
//      OfferModel(
//          date: '3/5/2020',
//          desc: 'عرض لفتره محدودهعرض لفتره محدودهعرض لفتره محدوده  ',
//          image:
//          'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/OFFER-arabic-(1).png?alt=media&token=22969023-f7b6-4f1f-ae25-7ded754d1f8f',
//          name: 'Title3'),
//      OfferModel(
//          date: '4/5/2020',
//          desc: 'عرض لفتره محدودهعرض لفتره محدودهعرض لفتره محدوده  ',
//          image:
//          'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/OFFER-arabic-(1).png?alt=media&token=22969023-f7b6-4f1f-ae25-7ded754d1f8f',
//          name: 'Title4'),
//    ];
//  }
}
