import 'package:kurdish_name/src/services/kurdish_names_service.dart';
import 'package:kurdish_name/src/models/names_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FuturesScreenView extends StatefulWidget {
  const FuturesScreenView({Key? key}) : super(key: key);

  @override
  State<FuturesScreenView> createState() => _FuturesScreenView();
}

class _FuturesScreenView extends State<FuturesScreenView> {
  final KurdishNamesService _namesService = KurdishNamesService();
  
  // TODO: create the datamodel                              : done
  // TODO: create a class for the kurdish names service      : done
  // TODO: create a method to get the list of kurdish names  : done
  // TODO: render the list of users to the screen            :done
  // TODO: create dropdown button to give data (search)      :done

  // Initial Selected Value 
  String dropdownvalueGender = 'Gender';
  String searchGender = 'Gender';

  String dropdownvalueSortedBy = 'Sorted By';
  String searchSortedBy = 'Sorted By';
  
  String dropdownvalueLimit = 'Limit';
  String searchLimit = 'Limit';
  
  // List of items in our dropdown menu
  var itemsGender = [
    'Gender',
    'Male',
    'Female',
    'Both',
  ];
  var itemsSortedBy = [
    'Sorted By',
    'positive',
    'negative',
  ];
  var itemsLimit = [
    'Limit',
    '5',
    '10',
    '25',
    '50',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                DropdownButton(
                  value: dropdownvalueGender,
                  
                  // Array list of items
                  items: itemsGender.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalueGender = newValue!;
                      searchGender = dropdownvalueGender;
                    });
                  },

                ),
                
                DropdownButton(
                  value: dropdownvalueSortedBy,

                  // Array list of items
                  items: itemsSortedBy.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalueSortedBy = newValue!;
                      searchSortedBy = dropdownvalueSortedBy;
                    });
                  },
                ),
                
                DropdownButton(
                  value: dropdownvalueLimit,

                  // Array list of items
                  items: itemsLimit.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalueLimit = newValue!;
                      searchLimit = dropdownvalueLimit;
                    });
                  },
                ),
              
              ],
            ),
          ),
          

          // show data 
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: FutureBuilder<KurdishNames>(
                  future: _namesService.fetchListOfNames(
                      searchLimit, searchGender, searchSortedBy),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CupertinoActivityIndicator();
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (snapshot.data == null) {
                      return const Text(' no data ');
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.names.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text("${snapshot.data!.names[index].positive_votes}  ${snapshot.data!.names[index].name}"),
                          children: [
                            Text(snapshot.data!.names[index].desc),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
