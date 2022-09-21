import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Controller controller = Get.put(Controller(cityName: 'Dhaka'));

  String? countryValue = "";

  String? stateValue = "";

  String? cityValue = "";

  String? address = "";

  var selected = false.obs;

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        const SizedBox(
          height: 6,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 201, 195, 114),
                border: Border.all(
                    color: const Color.fromARGB(255, 0, 0, 0), width: 3)),
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height * .21,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 25,
                  width: 140,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 214, 93, 174),
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 240, 223, 223))),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Fazr ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(controller.salahTimeModel!.items[0].fajr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 25,
                  width: 140,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 214, 93, 174),
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 240, 223, 223))),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dhuhr ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(controller.salahTimeModel!.items[0].dhuhr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 25,
                  width: 140,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 214, 93, 174),
                      border: Border.all(
                          width: 2, color: const Color.fromARGB(255, 240, 223, 223))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Asr ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(controller.salahTimeModel!.items[0].asr,
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 25,
                  width: 140,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 214, 93, 174),
                      border: Border.all(
                          width: 2, color: const Color.fromARGB(255, 240, 223, 223))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Maghrib ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(controller.salahTimeModel!.items[0].maghrib,
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 25,
                  width: 140,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 214, 93, 174),
                      border: Border.all(
                          width: 2, color: const Color.fromARGB(255, 240, 223, 223))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Isha ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(controller.salahTimeModel!.items[0].isha,
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 25,
                  width: 140,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 214, 93, 174),
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 240, 223, 223))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Shurooq ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          controller.salahTimeModel!.items[0].shurooq,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (() {
                  Get.defaultDialog(
                      backgroundColor: Color.fromARGB(255, 226, 201, 108),
                      title: 'Select your location',
                      content: Column(
                        children: [
                          CSCPicker(
                            layout: Layout.vertical,
                            flagState: CountryFlag.DISABLE,
                            onCountryChanged: (country) {},
                            onStateChanged: (state) {
                              stateValue = state;
                            },
                            onCityChanged: (city) {},
                            // countryDropdownLabel: "*Country",
                            // stateDropdownLabel: "*State",
                            // cityDropdownLabel: "*City",
                            // dropdownDialogRadius: 30,
                            // searchBarRadius: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  color: Colors.grey,
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                              SizedBox(
                                width: 20,
                              ),
                              FlatButton(
                                  onPressed: () {
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  color: Colors.green,
                                  child: const Text('Select',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                            ],
                          )
                        ],
                      ));
                }),
                child: Container(
                    height: 22,
                    width: 170,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 28, 146, 146)),
                    child: const Center(
                        child: Text('Select your location',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))),
              ),
              stateValue != ''  ? Text('${stateValue}') : Container()
            ]),
          ),
        ),
      ],
    );
}
}