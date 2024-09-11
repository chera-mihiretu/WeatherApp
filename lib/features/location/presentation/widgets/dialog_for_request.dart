import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/cores/theme/theme.dart';

class DialogForRequest extends StatelessWidget {
  final VoidCallback press;
  const DialogForRequest({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.width / 2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 2,
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Text(
                    'Please enable location, or grant the location permission',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: MyTheme.backgroundLight,
                      ),
                      onPressed: press,
                      child: Text(
                        'Done',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: MyTheme.backgroundLight,
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text(
                        'No Thank you!',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
