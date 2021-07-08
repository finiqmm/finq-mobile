part of 'total_amount_bloc.dart';

abstract class TotalAmountState extends Equatable {
  const TotalAmountState();

  @override
  List<Object> get props => [];
}

class TotalAmountInitial extends TotalAmountState {}

class TotalAmountLoadErrorState extends TotalAmountState {
  final String message;

  TotalAmountLoadErrorState({required this.message})
      : super();

  @override
  List<Object> get props => [message];
}

class TotalAmountLoadedState extends TotalAmountState {
  final TotalAmountEntity totalAmountEntity;
  TotalAmountLoadedState({required this.totalAmountEntity}) : super();

  @override
  List<Object> get props => [totalAmountEntity];
}

