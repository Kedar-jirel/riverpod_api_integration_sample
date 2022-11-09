import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample/providers/user_provider.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title:const Text( "Riverpod Sample"),
      ),
      body: data.when(data: (_data){
        return Column(
          children: [
            ..._data.map((e) => ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text(e.firstname),
                  subtitle: Text(e.lastname),
                  trailing: CircleAvatar(
                    backgroundImage: NetworkImage(e.avatar),
                  ),
                )
              ],

            ))
          ],
        );
      }, error: (err,str)=>Text(err.toString()), loading: ()=> const Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}



