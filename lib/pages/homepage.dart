import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:animate_do/animate_do.dart';

class MoneyHomePage extends StatelessWidget {
  const MoneyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String personName = "John Due";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.person)),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  personName,
                ),
                const Spacer(),
                CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.settings)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SlideInUp(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            child: Icon(Icons.account_balance_wallet),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Balance',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              FadeIn(
                                child: const Text(
                                  'Rs. 50000',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Income'),
                                  FadeIn(child: const Text('Rs.  50000')),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 0.5,
                            color: Colors.black54,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Income'),
                                  FadeIn(child: const Text('Rs.  50000')),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: index % 2 == 0
                          ? const SlidableIncomeCard()
                          : const SlidableExpensesCard(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Pulse(
        delay: const Duration(milliseconds: 2000),
        child: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class SlidableExpensesCard extends StatelessWidget {
  const SlidableExpensesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          GestureDetector(
            onTap: () {
              print("Edit button presed");
            },
            child: Container(
              width: 80,
              color: Colors.green.shade500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print("delete button presed");
              },
              child: Container(
                width: 80,
                color: Colors.red.shade500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
        child: Card(
          color: Colors.red.shade50.withOpacity(0.9),
          margin: const EdgeInsets.all(0),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
            title: const Text("Income"),
            subtitle: const Text("Salary"),
            trailing: const Text(
              "+ 40000",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ));
  }
}

class SlidableIncomeCard extends StatelessWidget {
  const SlidableIncomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          GestureDetector(
            onTap: () {
              print("Edit button presed");
            },
            child: Container(
              width: 80,
              color: Colors.green.shade500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print("delete button presed");
              },
              child: Container(
                width: 80,
                color: Colors.red.shade500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
        child: Card(
          color: Colors.green.shade50.withOpacity(0.9),
          margin: const EdgeInsets.all(0),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
            title: const Text("Expenses"),
            subtitle: const Text("Entertainment"),
            trailing: const Text(
              "- 40000",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ));
  }
}
