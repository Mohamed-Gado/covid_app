import 'package:covid_app/providers/operation.dart';
import 'package:covid_app/widgets/symptoms_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SymptomsAnalysisScreen extends StatefulWidget {
  static const routeName = 'symptoms-analysis-screen';
  const SymptomsAnalysisScreen({Key? key}) : super(key: key);

  @override
  _SymptomsAnalysisScreenState createState() => _SymptomsAnalysisScreenState();
}

class _SymptomsAnalysisScreenState extends State<SymptomsAnalysisScreen> {
  bool isInit = true;
  String selectedGender = 'All';
  List<String> genderList = [
    'All',
    'Female',
    'Male',
    'Other',
  ];
  String selectedAge = 'All';
  List<String> ageRanges = [
    'All',
    '0-9',
    '10-19',
    '20-24',
    '25-59',
    '60+',
  ];
  String selectedCountry = 'All';
  List<String> countries = [
    'All',
    'China',
    'Italy',
    'Iran',
    'Republic of Korean',
    'France',
    'Spain',
    'Germany',
    'UAE',
    'Other-EUR',
    'Other',
  ];
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Operation>(context, listen: false)
          .fetchDatabaseItems()
          .then((value) {
        setState(() {
          isInit = false;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final dbItems = Provider.of<Operation>(context).databaseItems;
    final filteredDbItems = Provider.of<Operation>(context).filteredDbItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms Analysis'),
      ),
      body: isInit
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dbItems.length <= 0
              ? Center(
                  child: Text('No Symptoms to show'),
                )
              : ListView(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
                  children: [
                    Text(
                      'Filters:',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Gender: '),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all()),
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(
                              hintText: '',
                            ),
                            hint: Text('Select Gender'),
                            value: selectedGender,
                            items: genderList.map(
                              (gender) {
                                return DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(gender),
                                );
                              },
                            ).toList(),
                            onChanged: (gender) {
                              setState(() {
                                selectedGender = gender!;
                              });
                              Provider.of<Operation>(context, listen: false)
                                  .filterDbItems(
                                selectedCountry,
                                selectedAge,
                                selectedGender,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Age Range: '),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all()),
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(
                              hintText: '',
                            ),
                            hint: Text('Select Range'),
                            value: selectedAge,
                            items: ageRanges.map(
                              (range) {
                                return DropdownMenuItem<String>(
                                  value: range,
                                  child: Text(range),
                                );
                              },
                            ).toList(),
                            onChanged: (range) {
                              setState(() {
                                selectedAge = range!;
                              });
                              Provider.of<Operation>(context, listen: false)
                                  .filterDbItems(
                                selectedCountry,
                                selectedAge,
                                selectedGender,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Country: '),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all()),
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration.collapsed(
                              hintText: '',
                            ),
                            hint: Text('Select Country'),
                            value: selectedCountry,
                            items: countries.map(
                              (country) {
                                return DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                );
                              },
                            ).toList(),
                            onChanged: (country) {
                              setState(() {
                                selectedCountry = country!;
                              });
                              Provider.of<Operation>(context, listen: false)
                                  .filterDbItems(
                                selectedCountry,
                                selectedAge,
                                selectedGender,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Number of Samples:'),
                      trailing: Text(
                          '${filteredDbItems.length} of ${dbItems.length}'),
                    ),
                    SymptomsBarChartWidget(),
                  ],
                ),
    );
  }
}
