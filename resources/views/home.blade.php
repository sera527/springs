@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Посты</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    <a href="{{ route('add_post_form') }}" class="btn btn-primary">Добавить пост</a>
                    <p class="pull-right">Всего постов: <span class="badge">{{$count}}</span></p>
                    @foreach($posts as $post)
                        <div class="card">
                            <div class="card-header"><a href="{{ asset('post/' . $post->slug) }}"><b>{{ $post->title }}</b></a></div>
                            <div class="card-body">
                                <p>{{ $post->text }}</p>
                            </div>
                        </div>
                        <br>
                    @endforeach
                    {{ $posts->links() }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
