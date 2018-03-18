@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">

                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="card">
                    <div class="card-header">Добавить пост</div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                        @endif

                        <form method="post" action="{{ route('add_post') }}">
                            {{ csrf_field() }}
                            <div class="form-group">
                                <label for="title">Оглавление</label>
                                <input type="text" maxlength="100" class="form-control" required id="title"
                                       name="title">
                            </div>
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <input type="text" maxlength="100" pattern="^[a-z0-9_-]+$" class="form-control" id="slug"
                                       name="slug">
                                <small id="slug" class="form-text text-muted">Не обязательно для заполнения.</small>
                            </div>
                            <div class="form-group">
                                <label for="text">Текст поста</label>
                                <textarea class="form-control" id="text" name="text" rows="3" required></textarea>
                            </div>
                            <fieldset>
                                <legend>Выберите авторов поста</legend>
                                @foreach($users as $user)
                                    @if(Auth::user()->id != $user->id)
                                        <div>
                                            <input type="checkbox" id="{{ $user->id }}" name="users[]" value="{{ $user->id }}">
                                            <label for="{{ $user->id }}">{{ $user->name }}, {{ $user->email }}</label>
                                        </div>
                                    @else
                                    <div>
                                        <input type="checkbox" checked disabled id="{{ $user->id }}" name="users[]" value="{{ $user->id }}">
                                        <label for="{{ $user->id }}">{{ $user->name }}, {{ $user->email }}</label>
                                    </div>
                                    @endif
                                @endforeach
                            </fieldset>
                            <button type="submit" class="btn btn-primary float-right">Отправить</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection