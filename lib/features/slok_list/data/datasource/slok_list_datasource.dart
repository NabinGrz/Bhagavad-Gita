import 'package:bhagvadgita/core/constants/string_constants.dart';
import 'package:bhagvadgita/core/request/request_client.dart';
import 'package:bhagvadgita/core/request/typed_response.dart';
import 'package:dio/dio.dart';

import '../model/bhagavad_gita_verse.dart';

abstract class SlokListDataSource {
  Future<DataResponse<List<BhagavadGitaVerse>>> getVerses(int number);
}

class SlokListDataSourceImpl extends SlokListDataSource {
  final RequestClient _requestClient;

  SlokListDataSourceImpl({required RequestClient requestClient})
      : _requestClient = requestClient;

  @override
  Future<DataResponse<List<BhagavadGitaVerse>>> getVerses(int number) async {
    try {
      final response = await _requestClient.get(
          endPoint: "${AppString.allChapters}/$number/verses/");
      if (response?.statusCode.toString()[0] == "2") {
        final data = response?.data as List<dynamic>;
        final dataList =
            data.map((e) => BhagavadGitaVerse.fromJson(e)).toList();
        return DataResponse.success(dataList);
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
