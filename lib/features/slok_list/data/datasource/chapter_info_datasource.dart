import 'package:bhagvadgita/core/constants/string_constants.dart';
import 'package:bhagvadgita/core/request/request_client.dart';
import 'package:bhagvadgita/core/request/typed_response.dart';
import 'package:bhagvadgita/features/slok_list/data/model/chapter_info.dart';
import 'package:dio/dio.dart';


abstract class ChapterInfoDataSource {
  Future<DataResponse<ChapterInfo>> getChapterInfo(int number);
}

class ChapterInfoDataSourceImpl extends ChapterInfoDataSource {
  final RequestClient _requestClient;

  ChapterInfoDataSourceImpl({required RequestClient requestClient})
      : _requestClient = requestClient;

  @override
  Future<DataResponse<ChapterInfo>> getChapterInfo(int number) async {
    try {
      final response = await _requestClient.get(
          endPoint: "${AppString.allChapters}/$number/");
      if (response?.statusCode.toString()[0] == "2") {
        final data = ChapterInfo.fromJson(response?.data);
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
