import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regres_cubit_bloc/Cubit/search_user_cubit.dart';
import 'package:regres_cubit_bloc/Cubit/user_cubit.dart';

import 'detailScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().getUserList();
    });
    return Scaffold(

      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, userState) {
          // TODO: implement listener
        },
        builder: (context, userState) {
          if (userState is UserLoaded) {
            context.read<SearchUserCubit>().searchUser(userState.data.data!, "");
            return BlocConsumer<SearchUserCubit, SearchUserState>(
              listener: (context, searchState) {
                // TODO: implement listener
              },
              builder: (context, searchState) {
                if(searchState is SearchUserLoaded){
                  return SafeArea(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 250,
                                  // color: Colors.green,
                                  child: TextField(
                                    onChanged: (value) {
                                      if(value.isEmpty){
                                        context.read<SearchUserCubit>().searchUser(userState.data.data!, "");
                                      }
                                      else{
                                        context.read<SearchUserCubit>().searchUser(userState.data.data!, value);
                                      }
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.search),
                                        label: const Text('Search'),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20))),
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.all(8),
                              shrinkWrap: true,
                                itemCount: searchState.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(data: searchState.data[index])),
                                      );
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      color: Colors.deepPurple,
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                               searchState.data[index].avatar!,
                                                // foundperson[index]['avatar'],
                                              ),
                                              radius: 40.0,
                                            ),
                                            Text(
                                                searchState.data[index].firstName!+" "+
                                              searchState.data[index].lastName!,


                                              // foundperson[index]['first_name'].toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                else{
                  return const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          else if (userState is UserError) {
            return const Center(
              child: Text("SomeThing went wrong"),
            );
          } else {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
