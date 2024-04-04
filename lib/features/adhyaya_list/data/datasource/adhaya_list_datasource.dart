import 'package:bhagvadgita/core/constants/string_constants.dart';
import 'package:bhagvadgita/core/request/request_client.dart';
import 'package:bhagvadgita/core/request/typed_response.dart';
import 'package:bhagvadgita/features/adhyaya_list/data/model/bhagavad_gita_chapters.dart';
import 'package:dio/dio.dart';

abstract class AdhyayaListDataSource {
  Future<DataResponse<List<BhagavadGitaChapter>>> getChapters();
}

class AdhyayaListDataSourceImpl extends AdhyayaListDataSource {
  final RequestClient _requestClient;

  AdhyayaListDataSourceImpl({required RequestClient requestClient})
      : _requestClient = requestClient;

  @override
  Future<DataResponse<List<BhagavadGitaChapter>>> getChapters() async {
    try {
      final response =
          await _requestClient.get(endPoint: AppString.allChapters);
      if (response?.statusCode.toString()[0] == "2") {
        final data = response?.data as List<dynamic>;
        final dataList =
            data.map((e) => BhagavadGitaChapter.fromJson(e)).toList();
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
