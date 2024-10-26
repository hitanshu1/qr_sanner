// ignore_for_file: public_member_api_docs

part of 'constants.dart';

class CollectionIDs {
  CollectionIDs._privateConstructor();
  static final CollectionIDs _instance = CollectionIDs._privateConstructor();
  static CollectionIDs get instance => _instance;

  static const String users = 'users';

  static const String industries = 'industries';
  static const String offers = 'offers';
  static const String service = 'service';
  static const String remoteConfigurations = 'remoteConfigurations/';
}

class Firestore {
  static const int queryLimit = 20;
}
