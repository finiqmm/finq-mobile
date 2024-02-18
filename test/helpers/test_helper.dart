

import 'package:finq/domain/usecases/use_case_imports.dart';
import 'package:finq/presentation/bloc/pincode/pincode_cubit.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GetPreferredTheme,
  UpdateTheme,
  CheckIfFirstTimeUser,
  GetSignedInUser,
  SignOut,
  PincodeCubit,
  GetArticle
])
void main(){}
