import 'package:flutter_practice/core/secrets/app_secrets.dart';
import 'package:flutter_practice/features/home/data/datasources/home_local_data_source.dart';
import 'package:flutter_practice/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_practice/features/home/domain/repository/home_repository.dart';
import 'package:flutter_practice/features/home/domain/usecases/all_topics.dart';
import 'package:flutter_practice/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';