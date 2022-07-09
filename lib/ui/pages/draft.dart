import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:new_hotel_app/services/storage_services.dart';

class Draft extends StatefulWidget {
  const Draft({Key? key}) : super(key: key);

  @override
  State<Draft> createState() => _Draft();
}

class _Draft extends State<Draft> {
  final Storage storage = Storage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Flexible(
            child: FutureBuilder(
              future: storage.listFile(),
              builder: (BuildContext context,AsyncSnapshot<ListResult> snapshot)
              {
                if (snapshot.connectionState==ConnectionState.done && snapshot.hasData)
                  {
                    return Container(
                      child: ListView.builder(
                          itemBuilder: (BuildContext context,int index)
                              {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(snapshot.data!.items[index].name),
                                );
                              }
                      ),
                    );
                  }
                if (snapshot.connectionState==ConnectionState.waiting || !snapshot.hasData)
                  {
                    return CircularProgressIndicator();
                  }
                return Container(
                  child: Text("error"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
