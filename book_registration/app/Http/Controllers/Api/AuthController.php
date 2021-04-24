<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use App\Notifications\PasswordResetNotification;

class AuthController extends Controller
{
    use RegistersUsers,SendsPasswordResetEmails;
    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    protected function validator(Request $request)
    {
        return Validator::make($request, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    public function register(Request $request)
    {
        $user = User::create([
                    'name' => $request['name'],
                    'email' => $request['email'],
                    'password' => Hash::make($request['password']),
                ]);

        $accessToken = $user->createToken('authToken')->accessToken;
        return response(['user' => $user, 'access_token' => $accessToken]);
    }

    public function login()
    {
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) {
            $user =  Auth::user();
            $accessToken = $user->createToken('authToken')->accessToken;
            return response(['user' => Auth::user(), 'Authorization' => 'Bearer '.$accessToken]);
        }
    }

    public function sendResetLinkEmail(Request $request)
    {
        $this->validateEmail($request);

        $response = $this->broker()->sendResetLink(
            $request->only('email')
        );

        return $response == Password::RESET_LINK_SENT
            ? response()->json(['message' => 'Reset link sent to your email.', 'status' => true], 201)
            : response()->json(['message' => 'Unable to send reset link', 'status' => false], 401);
    }

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new PasswordResetNotification($token));
    }

}
