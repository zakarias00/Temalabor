package hu.temalabor.GetFit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
public class GetfitApplication {


	public static void main(String[] args) {
<<<<<<< Updated upstream
		SpringApplication.run(GetfitApplication.class, args);
		//saveSports();
=======
		SpringApplication.run(GetFitApplication.class, args);
>>>>>>> Stashed changes
	}

//	static void saveSports(){
//		System.out.println("Data creation started...");
//		sportRepo.save(new Sport(0, "Futas", 0.207));
//		sportRepo.save(new Sport(1, "Kocogas", 0.169));
//		sportRepo.save(new Sport(2, "Seta", 0.118));
//		System.out.println("Data creation complete...");
//	}


}
