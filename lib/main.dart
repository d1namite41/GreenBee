import 'dart:ui';

import 'package:flutter/material.dart';

class Task {
  final String name;
  final String description;
  final String lngdescription;
  const Task({
    required this.name,
    required this.description,
    required this.lngdescription,
  });
}

class Reward {
  final String name;
  final String description;
  final int price;
  const Reward({
    required this.name,
    required this.description,
    required this.price,
  });
}

class User {
  String firstname;
  String lastname;
  String email;
  String phone;
  int points;
  int tasks;
  User({
    this.firstname = 'Bob',
    this.lastname = 'John',
    this.email = 'bobjohn@gmail.com',
    this.phone = '1234567890',
    this.points = 0,
    this.tasks = 0,
  });
}

bool user_settings_trigger = false;
User user = new User();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'test'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final _textController_fn = TextEditingController();
  final _textController_ln = TextEditingController();
  final _textController_e = TextEditingController();
  final _textController_pn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      height: 1920,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.fill),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                ),
              ),
              Image.asset('assets/images/logo.PNG', width: 250),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'User profile',
                style: TextStyle(
                    color: Color.fromARGB(255, 103, 195, 116), fontSize: 28),
              ),
              IconButton(
                  onPressed: () {
                    user_settings_trigger = !user_settings_trigger;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                  icon: Icon(Icons.info))
            ]),
          ],
        ),
        if (user_settings_trigger == true)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  controller: _textController_fn,
                  decoration: InputDecoration(
                      hintText: 'Firstname',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textController_fn.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ))),
              TextField(
                  controller: _textController_ln,
                  decoration: InputDecoration(
                      hintText: 'Lastname',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textController_ln.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ))),
              TextField(
                  controller: _textController_e,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textController_e.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ))),
              TextField(
                  controller: _textController_pn,
                  decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _textController_pn.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ))),
              MaterialButton(
                onPressed: () {
                  user.firstname = _textController_fn.text;
                  user.lastname = _textController_ln.text;
                  user.email = _textController_e.text;
                  user.phone = _textController_pn.text;
                  user_settings_trigger = false;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
                },
                color: Colors.green,
                child:
                    const Text('save', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        if (!user_settings_trigger)
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              user.firstname + ' ' + user.lastname,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.email,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              user.phone,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/images/home_button.png'),
              iconSize: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: ''),
                    ));
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/rewards.png'),
              iconSize: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RewardPage(),
                    ));
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/profile_button.png'),
              iconSize: 100,
              onPressed: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context) => const _MyHomePageState(),))
              },
            ),
          ],
        ),
      ]),
    )));
  }
}

class TaskPage extends StatelessWidget {
  final Task task;
  const TaskPage({
    Key? key,
    required this.task,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(task.name),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Container(
        height: 1920,
        width: double.infinity,
        color: Color.fromARGB(255, 111, 167, 112),
        child: Column(
          children: <Widget>[
            Text(
              task.name,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\n'+task.description+'\n'+task.lngdescription,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      )));
}

class RewardCard extends StatelessWidget {
  final Reward reward;
  const RewardCard({
    Key? key,
    required this.reward,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(reward.name),
        backgroundColor: Color.fromARGB(255, 93, 184, 96),
      ),
      body: Center(
          child: Container(
        height: 1920,
        width: double.infinity,
        color: Color.fromARGB(255, 111, 167, 112),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reward.name,
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text('Points: ' + reward.price.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                        )),
                  ],
                ),
                Text(
                  '\n\n\n\n',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        reward.description,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '',
                        style: const TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    ]),
              ],
            ),
            IconButton(
              icon: Image.asset('assets/images/buy_button.png'),
              iconSize: 250,
              onPressed: () {
                if (user.points >= reward.price) {
                  user.points -= reward.price;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RewardPage()));
                }
              },
            ),
          ],
        ),
      )));
}

class RewardPage extends StatelessWidget {
  List<Reward> rewards = [
    const Reward(
      name: 'Netflix',
      description: '1 month of Netflix',
      
      price: 150,
    ),
    const Reward(name: 'Spotify', description: '1 month of Spotify', price: 60),
    const Reward(
      name: 'HBO',
      description: '1 month of HBO',
      price: 120,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      height: 1920,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.fill),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                ),
              ),
              Image.asset('assets/images/logo.PNG', width: 250),
              Text(
                'Points: ' + user.points.toString(),
                style: const TextStyle(fontSize: 28),
              ),
            ]),
            Text(
              'Rewards',
              style: TextStyle(
                  color: Color.fromARGB(255, 103, 195, 116), fontSize: 28),
            ),
          ],
        ),
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return Container(
                    height: 175,
                    child: Card(
                      color: Color.fromARGB(255, 103, 195, 116),
                      child: ListTile(
                        title: Text(reward.name,
                            style:
                                TextStyle(fontSize: 40, color: Colors.white)),
                        subtitle: Text(
                            reward.description +
                                '\n' 'Points: ' +
                                reward.price.toString(),
                            style:
                                TextStyle(fontSize: 24, color: Colors.black)),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RewardCard(reward: reward),
                          ));
                        },
                      ),
                    ));
              },
            ),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/images/home_button.png'),
              iconSize: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: ''),
                    ));
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/rewards.png'),
              iconSize: 100,
              onPressed: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context) => const _MyHomePageState(),))
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/profile_button.png'),
              iconSize: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
            ),
          ],
        ),
      ]),
    )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [
    const Task(
      name: 'Recycle',
      description: 'Recycling is a great way people can make a difference.',
      lngdescription: '',
    ),
    const Task(
      name: 'Solar panels',
      description:
          'By installing solar panels, you can generate your own renewable electricity.',
           lngdescription: '',
    ),
    const Task(
      name: 'Lighting usage',
      description:
          'Tracking your lighting usage is a great way to save electricity',
           lngdescription: 'What’s the difference between kW and kWh? The kWh measurement is a way to quantify how much energy is used over a period of time. This can be calculated by multiplying the kW of energy consumption by the total number of hours the lighting has been operated.\nIncandescent bulbs: These are the bulbs most of us grew up on. The old-fashioned, typical light bulb. They’re not terribly efficient and they don’t last long.\nCompact fluorescent light bulbs (or CFLs): These are the “spiral-y” light bulbs that many of us think of when we talk about energy efficient light bulbs.\nLED bulbs: “Light emitting diodes”, for short, these are very energy efficient, but they still maintain the style and look of the classic incandescent bulb.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      height: 1920,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.fill),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                ),
              ),
              Image.asset('assets/images/logo.PNG', width: 250),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ]),
            Text(
              'Tasks',
              style: TextStyle(
                  color: Color.fromARGB(255, 103, 195, 116), fontSize: 28),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Container(
                height: 175,
                child: Card(
                  color: Color.fromARGB(255, 103, 195, 116),
                  child: ListTile(
                    title: Text(task.name,
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    subtitle: Text(task.description,
                        style: TextStyle(fontSize: 24, color: Colors.black)),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TaskPage(task: task),
                      ));
                    },
                  ),
                ));
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/images/home_button.png'),
              iconSize: 100,
              onPressed: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context) => const _MyHomePageState(),))
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/rewards.png'),
              iconSize: 100,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RewardPage()));
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/profile_button.png'),
              iconSize: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
            ),
          ],
        ),
      ]),
    )
            /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
            ));
  }
}
