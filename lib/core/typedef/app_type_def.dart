import 'package:dartz/dartz.dart';

import '../request/typed_response.dart';

typedef EitherResponse<T>
    = Future<Either<DataResponse<String>, DataResponse<T>>>;
