import 'package:kurdish_name/src/models/names_data_model.dart';
import 'package:http/http.dart' as http;

class KurdishNamesService {

  Future<KurdishNames> fetchListOfNames(
      String? limit, String? gender, String? sort) async {

        // API Info 
        //---------------------------------------- 
        // https://github.com/DevelopersTree/nawikurdi
        // https://nawikurdi.com/

        //API end point : https://nawikurdi.com/api
        ////////////////////////////////////////////
        
        // TODO : create our query            :done
        // TODO : create URI                  :done 
        // TODO : get data                    :done

    Map<String, String> _queryStirng = {
      "offset": "0",
    };
    // add limit 
    if (limit != 'Limit') {
      _queryStirng['limit'] = limit!;
    } else {
      _queryStirng['limit'] = '1000';
    }
    // add gender 
    if (gender != 'Gender') {
      _queryStirng['gender'] = gender!;
      if (gender != 'Both') {
        _queryStirng['gender'] = gender[0];
      } else {
        _queryStirng['gender'] = 'O';
      }
    }
    // add sort
    if (sort != 'Sorted By') {
      _queryStirng['sort'] = sort!;
    }


    Uri _kurdishNamesUri2 = Uri(
        scheme: 'https',
        host: 'nawikurdi.com',
        path: 'api',
        queryParameters: _queryStirng
    );

    http.Response _response =
        await http.get(_kurdishNamesUri2).catchError((err) => print(err));

    KurdishNames _kurdishNames = KurdishNames.fromJson(_response.body);

    return _kurdishNames;
  }
}
