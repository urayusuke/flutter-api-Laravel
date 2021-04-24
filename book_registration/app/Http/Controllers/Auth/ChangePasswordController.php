<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ChangePasswordController extends Controller
{
    public function showChangePasswordForm()
    {
        return view('password.change');
    }

    public function changePassword()
    {
          /* ===ここにパスワード変更の処理=== */
    }
}
