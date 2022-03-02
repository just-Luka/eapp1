import 'package:eapp1/domain/cubit/firestore/category_cubit.dart';
import 'package:eapp1/presentation/widgets/frames/listview_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeChip extends StatelessWidget {
  const HomeChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if(state is CategoryLoading) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListViewCenterFrame(
                    itemDistance: 13,
                    child: Chip(
                      label: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text('No Data'),
                      ),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                      backgroundColor: const Color.fromRGBO(232, 232, 232, 1.0),
                    ),
                    index: index,
                  );
                },
              );
            }
            else if(state is CategoryLoaded) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.model.length,
                itemBuilder: (context, index) {
                  return ListViewCenterFrame(
                    itemDistance: 13,
                    child: Chip(
                      label: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(state.model[index].name),
                      ),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                      backgroundColor: const Color.fromRGBO(232, 232, 232, 1.0),
                    ),
                    index: index,
                  );
                },
              );
            }else{
              return const SizedBox();
            }
          },
        ),
    );
  }
}
