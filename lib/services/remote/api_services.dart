import 'package:dio/dio.dart';
import 'package:nearby_me/core/data_state.dart';
import 'package:nearby_me/models/stores_model.dart';
import 'package:nearby_me/services/remote/api_constant.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.yelp.com/v3',
      headers: {
        'Authorization':
            'Bearer pK7_IkKRgRHwX2fFrRmBlbHO0dY70750InefH0OkuhoW3vdbYr8_Gp2fap6kv3MGlK7tn74bOpNMt46TIWxXZiHifUDMg96EeoJdNliMq0UcnRUlklhzytmq3Q4gZHYx',
      },
    ),
  );

  Future<DataState<List<StoresModel>>> getStoresList(String location) async {
    try {
      Response response =
          await _dio.get(ApiConstant.searchStores, queryParameters: {
        'location': location,
      });
      if (response.statusCode == 200) {
        final List<dynamic> rowData = response.data['businesses'];
        final List<StoresModel> storesList =
            rowData.map((e) => StoresModel.fromMap(e)).toList();
        return SuccessfulDataState(storesList);
      }
      return FailureDataState('Location not found');
    } on DioError catch (dioError) {
      switch (dioError.response?.statusCode) {
        case 400:
          return FailureDataState(
              'Bad Request. Message varies depending on failure scenario');
        case 401:
          return FailureDataState(
              'The API key has either expired or doesn\'t have the required scopes to query this endpoint.');
        case 404:
          return FailureDataState('Resource Not Found');
        case 500:
          return FailureDataState('Internal Server Error');
        case 503:
          return FailureDataState('Service Unavailable');

        default:
          FailureDataState('There is a problem to fetching data from server!');
      }
      return FailureDataState('Location not found');
    } catch (error) {
      return FailureDataState('Location not found');
    }
  }
}
