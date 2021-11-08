package api

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitClient {

    private const val BASE_URL = "localhost"

    val instance: API by lazy{
        Retrofit.Builder()
            .baseUrl("BASE_URL")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(API::class.java)
    }

   // val users:Response<List<User>> = API.getUsers()
}
