package hu.temalabor.GetFit;

import hu.temalabor.GetFit.model.Sport;
import hu.temalabor.GetFit.repository.SportRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@EnableMongoRepositories
@Configuration
public class MongoConfig {
    @Bean
    CommandLineRunner commandLineRunner(SportRepository sportRepository){
        return String ->{sportRepository.save(new Sport(1,"Futas", 0.256));};
    }
}
