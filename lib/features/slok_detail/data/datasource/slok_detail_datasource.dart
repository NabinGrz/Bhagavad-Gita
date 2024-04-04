import 'package:bhagvadgita/core/constants/string_constants.dart';
import 'package:bhagvadgita/core/request/request_client.dart';
import 'package:bhagvadgita/core/request/typed_response.dart';
import 'package:dio/dio.dart';

import '../../../slok_list/data/model/bhagavad_gita_verse.dart';

abstract class SlokDetailDataSource {
  Future<DataResponse<BhagavadGitaVerse>> getSlokDetail(
      int chapterNum, int verseNum);
}

class SlokDetailDataSourceImpl extends SlokDetailDataSource {
  final RequestClient _requestClient;

  SlokDetailDataSourceImpl({required RequestClient requestClient})
      : _requestClient = requestClient;

  @override
  Future<DataResponse<BhagavadGitaVerse>> getSlokDetail(
      int chapterNum, int verseNum) async {
    try {
      final response = await _requestClient.get(
          endPoint: "${AppString.allChapters}/$chapterNum/verses/$verseNum/");
      if (response?.statusCode.toString()[0] == "2") {
        final data = BhagavadGitaVerse.fromJson(response?.data);
        return DataResponse.success(data);
      } else {
        return DataResponse.error(response?.data);
      }
    } on DioException catch (e) {
      return DataResponse.error(e.toString());
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
