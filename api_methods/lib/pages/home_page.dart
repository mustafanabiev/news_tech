import 'dart:developer';

import 'package:api_methods/model/user_post_model.dart';
import 'package:api_methods/model/user_put_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GET
  // Future<UserModel?> getUsers() async {
  //   try {
  //     final dio = Dio();
  //     final response = await dio.get('https://reqres.in/api/users/2');
  //     if (response.statusCode == 200) {
  //       return UserModel.fromJson(response.data['data']);
  //     }
  //   } catch (error) {
  //     log(error.toString(), name: 'error', error: 'error');
  //   }
  //   return null;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: FutureBuilder(
  //       future: getUsers(),
  //       builder: (cxt, sn) {
  //         if (sn.connectionState == ConnectionState.waiting) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (sn.connectionState == ConnectionState.done) {
  //           final user = sn.data!;
  //           return Center(
  //             child: Card(
  //               child: ListTile(
  //                 leading: Text(user.id.toString()),
  //                 title: Text('${user.firstName} ${user.lastName}'),
  //                 subtitle: Text(user.email),
  //                 trailing: Image.network(user.avatar),
  //               ),
  //             ),
  //           );
  //         } else {
  //           return Center(child: Text(sn.error.toString()));
  //         }
  //       },
  //     ),
  //   );
  // }

  // -----------------------------------------------------------------------------------------------------------

  // POST

  // UserPostModel? userPostModel;

  // Future<UserPostModel?> postUsers(UserPostModel userPostModel) async {
  //   try {
  //     final dio = Dio();
  //     final response = await dio.post(
  //       'https://reqres.in/api/users',
  //       data: userPostModel.toJson(),
  //     );
  //     if (response.statusCode == 201) {
  //       return UserPostModel.fromJson(response.data);
  //     }
  //   } catch (error) {
  //     log(error.toString(), name: 'error', error: 'error');
  //   }
  //   return null;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       actions: [
  //         IconButton(
  //           onPressed: () async {
  //             userPostModel = await postUsers(
  //               const UserPostModel(name: 'Asanasdfg', job: 'Fludstter'),
  //             );
  //             setState(() {});
  //           },
  //           icon: const Icon(Icons.add),
  //         ),
  //       ],
  //     ),
  //     body: userPostModel == null
  //         ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //         : Center(
  //             child: Card(
  //               child: ListTile(
  //                 leading: Text(userPostModel!.id.toString()),
  //                 title: Text(userPostModel!.name),
  //                 subtitle: Text(userPostModel!.job),
  //                 trailing: Text(userPostModel!.createdAt.toString()),
  //               ),
  //             ),
  //           ),
  //   );
  // }

  // ---------------------------------------------------------------------------------------------------------

  // // PUT
  // UserPutModel? userPutModel;

  // Future<UserPutModel?> putUsers(UserPutModel userPutModel) async {
  //   try {
  //     final dio = Dio();
  //     final response = await dio.put(
  //       'https://reqres.in/api/users/2',
  //       data: userPutModel.toJson(),
  //     );
  //     if (response.statusCode == 200) {
  //       return UserPutModel.fromJson(response.data);
  //     }
  //   } catch (error) {
  //     log(error.toString(), name: 'error', error: 'error');
  //   }
  //   return null;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       actions: [
  //         IconButton(
  //           onPressed: () async {
  //             userPutModel = await putUsers(
  //               const UserPutModel(name: 'Aigul', job: 'web'),
  //             );
  //             setState(() {});
  //           },
  //           icon: const Icon(Icons.add),
  //         ),
  //       ],
  //     ),
  //     body: userPutModel == null
  //         ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //         : Center(
  //             child: Card(
  //               child: ListTile(
  //                 title: Text(userPutModel!.name),
  //                 subtitle: Text(userPutModel!.job),
  //                 trailing: Text(userPutModel!.updatedAt.toString()),
  //               ),
  //             ),
  //           ),
  //   );
  // }

  // DELETE
  String? deleteText;

  Future<String?> deleteUsers() async {
    try {
      final dio = Dio();
      final response = await dio.delete('https://reqres.in/api/users/2');
      if (response.statusCode == 204) {
        return 'Success';
      } else {
        return 'Error';
      }
    } catch (error) {
      log(error.toString(), name: 'error', error: 'error');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              deleteText = await deleteUsers();
              setState(() {});
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: deleteText == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(child: Card(child: ListTile(title: Text(deleteText!)))),
    );
  }
}
