import 'dart:developer';

import 'package:flutter/material.dart';

class InputChipN extends StatefulWidget {
  const InputChipN({super.key});

  @override
  State<InputChipN> createState() => _InputChipNState();
}

class _InputChipNState extends State<InputChipN> {
  late TextEditingController seachController;

  @override
  void initState() {
    // TODO: implement initState
    seachController = TextEditingController();

    super.initState();
  }

  Set<String> chips = <String>{};
  @override
  Widget build(BuildContext context) {
    //add
    void addChip(String value) {
      if (value.isEmpty) return;
      setState(() {
        chips.add(value.trim());
      });
      seachController.clear();
    }

//remove
    removeChip(String e) {
      chips.remove(e);
      setState(() {});
    }

    log(chips.length.toString());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ...chips.map(((e) => Chip(
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                            backgroundColor: Colors.black,
                            deleteIconColor: Colors.white,
                            onDeleted: () => removeChip(e),
                            deleteIcon: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            label: Text(
                              e,
                            ),
                          ))),
                      TextFormField(
                        // maxLines: null,
                        controller: seachController,
                        decoration:
                            const InputDecoration(border: InputBorder.none),

                        cursorColor: Colors.black,
                        onChanged: (value) {
                          if (value.contains(",")) {
                            addChip(value.replaceAll(",", ""));
                          }
                          // final lastCharacter = value.characters.last;
                          // if (lastCharacter == ',') {
                          //   final word = value.substring(0, value.length - 1);
                          //   setState(() {
                          //     chips.add(word);
                          //   });
                          // setState(() {
                          //   chips.add(value.trim());
                          // });
                          // seachController.clear();
                        },
                        // decoration: const InputDecoration(
                        //     border: InputBorder.none,
                        //     enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //     focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
