import 'package:flutter/material.dart';

class FilmsPage extends StatefulWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 155,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage('images/poster.jpg'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Spider-Man: No Way Home',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'December 15, 2021',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Peter Parker is unmasked and no longer able to separate his normal '
                                'life from the high-stakes of being a super-hero. When he asks for help '
                                'from Doctor Strange the stakes become even more dangerous, forcing him to '
                                'discover what it truly means to be Spider-Man.',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          print('tapped');
                        },
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder()
            ),
          ),
        )
      ],
    );
  }
}
