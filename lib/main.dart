import 'package:flutter/material.dart';

const primaryColor = Color(0xff24292E);
const accentColor = Color(0xf0979A9C);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GitHub(),
    );
  }
}

class GitHub extends StatefulWidget {
  @override
  _GitHubState createState() => _GitHubState();
}

class _GitHubState extends State<GitHub> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 650 &&
        MediaQuery.of(context).size.width < 768;
    final isTablet = MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1024;
    final isLaptop = MediaQuery.of(context).size.width >= 1024;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Image.network(
            "https://i.ibb.co/Xxd5yWg/Git-Hub-Mark-Light-32px.png",
          ),
        ),
        title: Row(
          children: <Widget>[
            SearchBar(
              isMobile: isMobile,
            ),
            isLaptop
                ? Links(
                    isMobile: isMobile,
                    isLaptop: isLaptop,
                    isTablet: isTablet,
                  )
                : Container(),
          ],
        ),
        actions: !isLaptop
            ? <Widget>[
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                      ),
                    );
                  },
                ),
              ]
            : <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                  ),
                  onPressed: () {},
                ),
                CustomDropDown(
                  isMobile: isMobile,
                  leading: Icon(Icons.add),
                  items: [
                    'New repository',
                    'Import repository',
                    'New gist',
                    'New organization',
                    'New project',
                  ],
                ),
                CustomDropDown(
                  isMobile: isMobile,
                  leading: CircleAvatar(
                    maxRadius: 15,
                  ),
                  items: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Signed in as',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'YazeedAlKhalaf',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('👨‍💻'),
                          Text('Youngest Partici...'),
                        ],
                      ),
                    ),
                    'Your profile',
                    'Your repositories',
                    'Your organizations',
                    'Your projects',
                    'Your stars',
                    'Your gists',
                    Divider(),
                    'Upgrade',
                    'Feature preview',
                    'Help',
                    'Settings',
                    'Sign Out',
                  ],
                ),
              ],
      ),
      body: Body(
        isMobile: isMobile,
        isTablet: isTablet,
        isLaptop: isLaptop,
      ),
      drawer: isTablet || isMobile
          ? Drawer(
              child: Container(
                color: primaryColor,
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(),
                      accountName: Text('YazeedAlKhalaf'),
                      accountEmail: Text('yazeedfady@gmail.com'),
                    ),
                    SearchBar(isMobile: isMobile),
                    Links(
                      isMobile: isMobile,
                      isLaptop: isLaptop,
                      isTablet: isTablet,
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}

class Body extends StatefulWidget {
  final bool isMobile;
  final bool isTablet;
  final bool isLaptop;

  const Body({
    @required this.isMobile,
    @required this.isTablet,
    @required this.isLaptop,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: <Widget>[
          // Left Panel
          widget.isLaptop
              ? Container(
                  width: widget.isLaptop ? 400 : 300,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              500,
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(),
                              SizedBox(width: 10),
                              Text(
                                'YazeedAlKhalaf',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Repositories',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                500,
                              ),
                            ),
                            onPressed: () {},
                            color: Color(0xff2EA44F),
                            label: Text(
                              'New',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.book,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SearchBar(
                        isMobile: widget.isMobile,
                        searchHintText: 'Find a repository...',
                      ),
                    ],
                  ),
                )
              : Container(),

          // Main Panel
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Recent activity
                Container(
                  height: 450,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CustomDivider(
                        opacity: 1,
                        width: 75,
                      ),
                      Container(
                        height: 310,
                        margin: const EdgeInsets.all(5),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.error_outline,
                                        color: Color(0xff28A745),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Text(
                                                  'New Flutter CLI command to create a project for one platform',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(width: 5),
                                            ],
                                          ),
                                          Chip(
                                            backgroundColor:
                                                Colors.yellowAccent,
                                            padding: const EdgeInsets.all(0),
                                            label: Text(
                                              'severe: new feature',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle: Wrap(
                                        children: <Widget>[
                                          Text(
                                            'flutter/flutter',
                                            style: TextStyle(
                                              color: accentColor,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '•',
                                            style: TextStyle(
                                              color: accentColor,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'You commented 4 days ago',
                                            style: TextStyle(
                                              color: accentColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Wrap(
                                        children: [
                                          Wrap(
                                            children: <Widget>[
                                              Icon(
                                                Icons.message,
                                                color: accentColor,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '5',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: accentColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (index != 2)
                                      Opacity(
                                        opacity: 0.3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: accentColor,
                                            borderRadius: BorderRadius.circular(
                                              500,
                                            ),
                                          ),
                                          height: 2,
                                          width: double.infinity,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // All activity
                // Container(
                //   height: 450,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text(
                //         'All Activity',
                //         style: TextStyle(
                //           fontSize: 18,
                //         ),
                //       ),
                //       CustomDivider(
                //         opacity: 1,
                //         width: 75,
                //       ),
                //       Container(
                //         height: 310,
                //         margin: const EdgeInsets.all(5),
                //         child: Card(
                //           child: Padding(
                //             padding: const EdgeInsets.all(10),
                //             child: ListView.builder(
                //               itemCount: 1,
                //               itemBuilder: (BuildContext context, int index) {
                //                 return Column(
                //                   children: [
                //                     ListTile(
                //                       leading: CircleAvatar(),
                //                       title: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [],
                //                       ),
                //                     ),
                //                   ],
                //                 );
                //               },
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),

          // Right Panel
          queryData.width >= 1024
              ? Container(
                  width: queryData.width >= 1024 ? 300 : 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Text(
                              'Explore repositories',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                        child: CustomDivider(
                          opacity: 1,
                          width: 75,
                        ),
                      ),
                      Container(
                        height: 360,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                margin: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'YazeedAlKhalaf/GitHub_Clone',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'A GitHub clone with Flutter',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor:
                                                  Color(0xff00B4AB),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Dart',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.star_border),
                                            SizedBox(width: 4),
                                            Text(
                                              '35k',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 2,
                        ),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text('Explore more →'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
////////////////////////////// Small UI parts ///////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

class SearchBar extends StatelessWidget {
  final isMobile;
  final searchHintText;

  const SearchBar({@required this.isMobile, this.searchHintText});

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Container()
        : Container(
            width: 250,
            height: 35,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: accentColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  searchHintText ?? 'Search or jump to...',
                  style: TextStyle(
                    fontSize: 15,
                    color: accentColor,
                  ),
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: accentColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '/',
                      style: TextStyle(
                        fontSize: 13,
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class Links extends StatelessWidget {
  final isLaptop;
  final isTablet;
  final isMobile;

  const Links({
    @required this.isLaptop,
    @required this.isTablet,
    @required this.isMobile,
  });

  Widget buildLink({
    @required String text,
    @required Function onTap,
  }) {
    var color = Colors.white;

    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: isTablet || isMobile ? null : 35,
      child: isMobile || isTablet
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildLink(
                    text: 'Pull Requests',
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildLink(
                    text: 'Issues',
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildLink(
                    text: 'Marketplace',
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildLink(
                    text: 'Explore',
                    onTap: () {},
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildLink(
                  text: 'Pull Requests',
                  onTap: () {},
                ),
                buildLink(
                  text: 'Issues',
                  onTap: () {},
                ),
                buildLink(
                  text: 'Marketplace',
                  onTap: () {},
                ),
                buildLink(
                  text: 'Explore',
                  onTap: () {},
                ),
              ],
            ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  final bool isMobile;
  final Widget leading;
  final List<dynamic> items;

  const CustomDropDown(
      {@required this.isMobile, @required this.leading, @required this.items});

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: DropdownButton<String>(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        hint: widget.leading,
        items: widget.items.map((dynamic value) {
          if (value is String) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }

          if (value is Widget) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: value,
            );
          }
        }).toList(),
        onChanged: (_) {},
        // selectedItemBuilder: (BuildContext context) {
        //   return <Widget>[];
        // },
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  final double opacity;
  final int width;

  const CustomDivider({this.opacity, this.width});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 0.3,
      child: Container(
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(
            500,
          ),
        ),
        height: 2,
        width: width ?? double.infinity,
        margin: const EdgeInsets.only(
          left: 5,
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
////////////////////////////// HELPERS //////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
