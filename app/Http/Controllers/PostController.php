<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;
use Auth;
use Illuminate\Support\Str;

class PostController extends Controller
{
    public function index()
    {
        return view('home');
    }

    public function create()
    {
        $users = User::all();

        return view('add_post', ['users' => $users]);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:100',
            'slug' => 'nullable|regex:/^[a-z0-9_-]+$/|unique:posts,slug|max:100',
            'text' => 'required|string',
            'users' => 'array'
        ]);

        if (!isset($validatedData['slug'])) {
            $validatedData['slug'] = Str::slug($validatedData['title']);
        }

        $post = new Post();
        $post->title = $validatedData['title'];
        $post->slug = $validatedData['slug'];
        $post->text = $validatedData['text'];
        if ($post->save()) {
            if (!isset($validatedData['users'])) {
                $validatedData['users'] = [];
            }
            $users = $this->getValidUsers($validatedData['users']);

            $post->users()->attach($users);

            return redirect('post/' . $post->slug);
        }
        return redirect()->route('add_post_form');
    }

    public function show($slug)
    {
        echo $slug;
    }

    private function getValidUsers(array $users)
    {
        for ($i = 0; $i < count($users); $i++) {
            if (!is_numeric($users[$i])) {
                unset($users[$i]);
            }
        }
        array_unshift($users, Auth::id());
        return array_unique($users);
    }
}
