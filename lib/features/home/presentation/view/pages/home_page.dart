import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/core/config/base_state/base_state.dart';
import 'package:study_app/core/config/di/injectable_config.dart';
import 'package:study_app/core/errors/handle_errors/handle_errors.dart';
import 'package:study_app/core/theme/styles.dart';
import 'package:study_app/features/home/presentation/view_model/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeCubit homeCubit = getIt.get<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit..getAllData(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text('Products List:', style: Styles.bold(context, 20)),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state.productHomeState?.state == StateType.error) {
                          final result = state.productHomeState?.exception;
                          final widget = handleNetwork(
                            result,
                            () async => await homeCubit.getProducts(),
                          );
                          return widget is Widget
                              ? widget
                              : Text(
                                  widget as String,
                                  style: Styles.medium(context, 14),
                                );
                        } else if (state.productHomeState?.state ==
                            StateType.success) {
                          return SizedBox(
                            height: 200, // Set a fixed height for the list
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  state.productHomeState?.data?[index].name ?? '',
                                  style: Styles.medium(context, 16),
                                ),
                              ),
                              separatorBuilder: (context, index) => const Divider(),
                              itemCount: state.productHomeState?.data?.length ?? 0,
                            ),
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    Text('Categories List:', style: Styles.bold(context, 20)),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state.categoryHomeState?.state == StateType.error) {
                          final result = state.categoryHomeState?.exception;
                          final widget = handleNetwork(
                            result,
                            () async => await homeCubit.getCategories(),
                          );
                          return widget is Widget
                              ? widget
                              : Text(
                                  widget as String,
                                  style: Styles.medium(context, 14),
                                );
                        } else if (state.categoryHomeState?.state ==
                            StateType.success) {
                          return SizedBox(
                            height: 200, // Set a fixed height for the list
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  state.categoryHomeState?.data?[index].name ?? '',
                                  style: Styles.medium(context, 16),
                                ),
                              ),
                              separatorBuilder: (context, index) => const Divider(),
                              itemCount: state.categoryHomeState?.data?.length ?? 0,
                            ),
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
