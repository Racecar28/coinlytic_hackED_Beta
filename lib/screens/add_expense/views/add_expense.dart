import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  String iconSelected = '';

  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  Color categoryColor = Colors.white;
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryIconController = TextEditingController();
  TextEditingController categoryColorController = TextEditingController();
  bool isLoading = false;
  //Category category = Category.empty;

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    // expense = Expense.empty;
    // expense.expenseId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add Expenses",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: categoryController,
                readOnly: true,
                onTap: () {},
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.list,
                    size: 16,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          bool isExpanded = false;

                          return StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                              title: const Text('Create a Category'),
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      //textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.blue,
                                        hintText: 'Name',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      onTap: () {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      //textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        suffixIcon: const Icon(
                                          Icons.arrow_drop_down_sharp,
                                          size: 12,
                                        ),
                                        fillColor: Colors.blue,
                                        hintText: 'Icon',
                                        border: OutlineInputBorder(
                                            borderRadius: isExpanded
                                                ? const BorderRadius.vertical(
                                                    top: Radius.circular(12))
                                                : BorderRadius.circular(12),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                    isExpanded
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        bottom: Radius.circular(
                                                            12))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          mainAxisSpacing: 5,
                                                          crossAxisSpacing: 5),
                                                  itemCount:
                                                      myCategoriesIcons.length,
                                                  itemBuilder:
                                                      (context, int i) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          iconSelected =
                                                              myCategoriesIcons[
                                                                  i];
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  width: 3,
                                                                  color: iconSelected ==
                                                                          myCategoriesIcons[
                                                                              i]
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .grey,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        '/assets/${myCategoriesIcons[i]}.png'))),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          )
                                        : Container(),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                      controller: categoryColorController,
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx2) {
                                              return AlertDialog(
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ColorPicker(
                                                      pickerColor:
                                                          categoryColor,
                                                      onColorChanged: (value) {
                                                        setState(() {
                                                          categoryColor = value;
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height: 50,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(ctx2);
                                                          },
                                                          style: TextButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12))),
                                                          child: const Text(
                                                            'Save Color',
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: categoryColor,
                                        hintText: 'Color',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                    // TextFormField(
                                    //   onTap: () {
                                    //     context: context,
                                    //     builder: (context){
                                    //       return Color
                                    //     }
                                    //
                                    //   },
                                    //   //textAlign: TextAlign.center,
                                    //   textAlignVertical:
                                    //       TextAlignVertical.center,
                                    //   readOnly: true,
                                    //   decoration: InputDecoration(
                                    //     isDense: true,
                                    //     filled: true,
                                    //     fillColor: Colors.blue,
                                    //     hintText: 'Color',
                                    //     border: OutlineInputBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(12),
                                    //         borderSide: BorderSide.none),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      );
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 16,
                    color: Colors.grey,
                  ),
                  hintText: 'Category',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: dateController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialDate: selectDate,
                  );
                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.date_range,
                    size: 16,
                    color: Colors.grey,
                  ),
                  hintText: 'Date',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
