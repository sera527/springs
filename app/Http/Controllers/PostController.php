<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;

class PostController extends Controller
{
    public function index()
    {
        return view('home');
    }

    public function create()
    {
        return view('add_post');
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:100',
            'slug' => 'required|regex:/^[a-z0-9_-]+$/|unique:posts,slug|max:100',
            'text' => 'required|string',
        ]);

        $post = new Post();
        $post->title = $validatedData['title'];
        $post->slug = $validatedData['slug'];
        $post->text = $validatedData['text'];
        $post->save();
        $post->users()->attach([1, 2]);
    }
}
