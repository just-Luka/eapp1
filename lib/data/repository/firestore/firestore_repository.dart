import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/data/models/firestore/i_model_json_convert.dart';
import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/data/repository/firestore/list/base_firestore_list_repository.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/domain/preferences/set_app_preference.dart';
import 'package:eapp1/domain/preferences/set_firestore_preference.dart';

class FirestoreRepository<T extends IModelJsonConvert> with BasicKit {
  SPKeyword keyword;

  FirestoreRepository({
    required this.keyword
  });

  // TODO remove it from here
  Future<List<T>> firestoreList(BaseFirestoreListRepository<T> firestoreListRepository) async{

    if(await isDeviceOnline()) {

      // if (//refresh)
      List<T> dataCloud = await firestoreListRepository.cloud();

      await SetFirestorePreference<T>().setModel(dataCloud, keyword);

      return dataCloud;

      return firestoreListRepository.cache();
    }else{
      List<T> dataCache = firestoreListRepository.cache();

      if(dataCache.isNotEmpty) {
        return dataCache;
      }
      return [];
    }
  }
}