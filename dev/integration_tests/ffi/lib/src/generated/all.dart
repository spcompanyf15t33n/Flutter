import "dart:async";

import "aliasing_test.dart" as main0;
import "data_not_asan_test.dart" as main1;
import "data_test.dart" as main2;
import "extension_methods_test.dart" as main3;
import "external_typed_data_test.dart" as main4;
import "function_callbacks_test.dart" as main5;
import "function_structs_test.dart" as main6;
import "function_test.dart" as main7;
import "negative_function_test.dart" as main8;
import "regress_37254_test.dart" as main9;
import "regress_39044_test.dart" as main10;
import "regress_39063_test.dart" as main11;
import "regress_39068_test.dart" as main12;
import "sizeof_test.dart" as main13;
import "snapshot_test.dart" as main14;
import "stacktrace_regress_37910_test.dart" as main15;
import "structs_test.dart" as main16;
import "variance_function_test.dart" as main17;

Future invoke(dynamic fun) async {
  if (fun is void Function() || fun is Future Function()) {
    return await fun();
  } else {
    return await fun(<String>[]);
  }
}

dynamic main() async {
  await invoke(main0.main);
  await invoke(main1.main);
  await invoke(main2.main);
  await invoke(main3.main);
  await invoke(main4.main);
  await invoke(main5.main);
  await invoke(main6.main);
  await invoke(main7.main);
  await invoke(main8.main);
  await invoke(main9.main);
  await invoke(main10.main);
  await invoke(main11.main);
  await invoke(main12.main);
  await invoke(main13.main);
  await invoke(main14.main);
  await invoke(main15.main);
  await invoke(main16.main);
  await invoke(main17.main);
}
