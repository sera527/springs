@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <div class="card">
                    <div class="card-header">{{ $post->title }}</div>

                    <div class="card-body">
                        <p>{{ $post->text }}</p>
                        <br>
                        <p><b>Авторы:</b></p>
                        @foreach($users as $user)
                        <ul>
                            <li>{{ $user->name }}, <a href="mailto:{{ $user->email }}">{{ $user->email }}</a></li>
                        </ul>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection