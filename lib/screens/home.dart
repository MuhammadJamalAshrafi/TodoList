import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/widgets/app_button.dart';
import 'package:todo_list/widgets/input_field.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
int show = 1;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.png"), fit: BoxFit.fill)),
          child:
              show == 1 ?
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/task_wait.png"),
                  const SizedBox(height: 25),
                  const Text("Waiting for your Task", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white60))
                ],
              ),
            )
              : Padding(
            padding: const EdgeInsets.only(left: 25, top: 35, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text("Tasks",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))
                  ],
                ),
                Expanded(
                  child: ListView.builder(itemCount: 10, itemBuilder: cards, scrollDirection: Axis.vertical),
                ),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              context: context,
              builder: (context) => BottomSheet(
                backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  onClosing: () {},
                  builder: (_) => SizedBox(
                        height: 405,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20, right: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 290,
                                height: 3,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 30),
                              const Text("Add Task",
                                  style:
                                  TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontSize: 30,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600
                                  )),
                              const SizedBox(height: 10),
                              const InputField(title: "Enter Title", height: 60),
                              const SizedBox(height: 20),
                              const InputField(title: "Enter Description", height: 120),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    show = 0;
                                  });
                                  Navigator.pop(context);
                                },
                                child: const AppButton(name: "Add Task")
                              )
                            ],
                          ),
                        ),
                      )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width - 290,
                  height: 3,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // borderRadius: BorderRadius.circular(50)
        ),
      ),
    );
  }

  Widget cards(BuildContext context, int index) => Card(
      color: Colors.black.withOpacity(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 22),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Afghanistan",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(AssetImage("images/edit.png")),
                    color: Colors.white),
                IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(AssetImage("images/delete.png")),
                    color: Colors.white)
              ],
            ),
            const Text(
                "The Jews who descended from Abraham were never really the nation we associate with greatness.  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ));
}
