package api

import data.DefaultResponse
import data.LoginResponse
import data.User
import retrofit2.Call
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.*

interface API {

    @GET("users")
    fun getUsers() :Response<List<User>>

    @FormUrlEncoded
    @POST("createuser")
    fun createUser(
        @Field ("name")name:String,
        @Field ("username")username:String,
        @Field ("email")email:String,
        @Field ("password")password:String
    ): Call<DefaultResponse>

    @FormUrlEncoded
    @POST("userlogin")
    fun userLogin(
        @Field("email")email: String,
        @Field("password")password: String
    ): Call<LoginResponse>



}