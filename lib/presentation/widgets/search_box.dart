import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: InkWell(
                  onTap: () => {print('vbh')},
                  child: const Icon(
                    Icons.search,
                    size: 36,
                    color: Colors.grey,
                  ),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10.0)
                ),
              ),
              hintText: 'Search For A Hotel',
              hintStyle: const TextStyle(
                  color: Colors.grey
              ),
            ),
          ),
          flex: 10,
        ),

        const SizedBox(width: 10),

        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => {print('vbh')},
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(53, 133, 255, 1.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(53, 133, 255, 1.0).withOpacity(0.4),
                    blurRadius: 10.0,
                    offset: const Offset(-2.0, 7),
                  ),
                ],
              ),
              child: const Icon(
                Icons.filter_list_alt,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
